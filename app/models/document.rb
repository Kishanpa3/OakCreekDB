class Document < ApplicationRecord
  belongs_to :animal
  has_one :animal_profile_image, dependent: :destroy
  
  include DocumentUploader::Attachment(:file) # DocumentUploader will attach and manage `file`
end
