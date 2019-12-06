class Attachment::PromoteJob < ApplicationJob
  # def perform(attacher_class, record_class, record_id, name, file_data)
  def perform(attacher_class, record, name, file_data)
    puts "PromoteJob running"
    attacher_class = Object.const_get(attacher_class)
    # record         = Object.const_get(record_class).find(record_id) # if using Active Record

    attacher = attacher_class.retrieve(model: record, name: name, file: file_data)
    # attacher.refresh_metadata!
    # attacher.create_derivatives if record.is_a?(Document)
    if record.is_a?(Document) && (record.file.mime_type =~ /^image\// || record.file.mime_type =~ /\/pdf$/)
      attacher.create_derivatives
    end
    attacher.atomic_promote
  rescue Shrine::AttachmentChanged, ActiveRecord::RecordNotFound
    # attachment has changed or the record has been deleted, nothing to do
  end
end