require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
 
s3_options = { 
  bucket:            Rails.application.credentials.bucket, # required 
  access_key_id:     Rails.application.credentials.access_key_id,
  secret_access_key: Rails.application.credentials.secret_access_key,
  region:            Rails.application.credentials.region,
}
 
Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :instrumentation # adds instrumentation
Shrine.plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :derivatives          # up front processing
Shrine.plugin :derivation_endpoint, # on-the-fly processing
  secret_key: Rails.application.credentials.secret_key_base

Shrine.plugin :uppy_s3_multipart

# add an endpoint which returns valid request params and URL for the S3 upload
Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  # Uppy will send the "filename" and "type" query parameters
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    "inline; filename=\"#{filename}\"", # set download filename
    content_type:           type,                               # set content type (defaults to "application/octet-stream")
    content_length_range:   0..(100*1024*1024),                  # limit upload size to 100 MB
  }
}

# delay promoting and deleting files to a background job (`backgrounding` plugin)
Shrine.plugin :backgrounding
Shrine::Attacher.promote_block do
  Attachment::PromoteJob.perform_later(self.class.name, record, name, file_data)
end
Shrine::Attacher.destroy_block do
  Attachment::DestroyJob.perform_later(self.class.name, data)
end