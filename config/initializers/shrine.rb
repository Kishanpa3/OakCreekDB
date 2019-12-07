require "shrine"
require "shrine/storage/s3"
 
# s3_options = { 
#   bucket:            Rails.application.credentials.bucket, # required 
#   access_key_id:     Rails.application.credentials.access_key_id,
#   secret_access_key: Rails.application.credentials.secret_access_key,
#   region:            Rails.application.credentials.region,
# }

s3_options = { 
  bucket:            ENV["S3_BUCKET"], # required 
  access_key_id:     ENV["S3_ACCESS_KEY_ID"],
  secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
  region:            ENV["S3_REGION"],
}

Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :instrumentation        # adds instrumentation
Shrine.plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
# Shrine.plugin :infer_extension, log_subscriber: nil
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data    # re-extract metadata when attaching a cached file
Shrine.plugin :derivatives            # up front processing
Shrine.plugin :derivation_endpoint, metadata: ["mime_type"],   # on-the-fly processing
  # secret_key: Rails.application.credentials.shrine_secret_key_base
  secret_key: ENV["SHRINE_SECRET_KEY_BASE"]

Shrine.plugin :uppy_s3_multipart
Shrine.plugin :url_options, cache: { expires_in: 7*24*60*60 }, store: { expires_in: 7*24*60*60 }

# delay promoting and deleting files to a background job (`backgrounding` plugin)
Shrine.plugin :backgrounding
Shrine::Attacher.promote_block do
  Attachment::PromoteJob.perform_later(self.class.name, record, name, file_data) # or perform_async
end
Shrine::Attacher.destroy_block do
  Attachment::DestroyJob.perform_later(self.class.name, data)
end