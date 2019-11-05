class Document < ApplicationRecord
  belongs_to :animal
  
  include DocumentUploader::Attachment(:file) # DocumentUploader will attach and manage `file`
end
