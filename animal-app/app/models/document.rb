class Document < ApplicationRecord
  belongs_to :animal
  include FileUploader::Attachment(:file)
end
