class Document < ApplicationRecord
  belongs_to :animal
  include FileUploader::Attachment(:file) # FileUploader will attach and manage `file`
end
