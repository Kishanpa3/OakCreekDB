class Animal < ApplicationRecord
  has_one :diet, dependent: :destroy
  accepts_nested_attributes_for :diet, allow_destroy: true
  #validates :tag, presence: true
  #validates :sex, length: {minimum: 6}
  #validates :neutered, length: {minimum: 3}
  
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true
  validates_associated :documents
  
  # include ImageUploader::Attachment(:profile_pic)  # ImageUploader will attach and manage `profile_pic`
end
