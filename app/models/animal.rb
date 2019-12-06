class Animal < ApplicationRecord
  has_one :diet, dependent: :destroy
  has_one :animal_profile_image, dependent: :destroy
  accepts_nested_attributes_for :diet, allow_destroy: true
  #validates :tag, presence: true
  #validates :sex, length: {minimum: 6}
  #validates :neutered, length: {minimum: 3}
  
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true
  validates_associated :documents
  
  # include ImageUploader::Attachment(:profile_pic)  # ImageUploader will attach and manage `profile_pic`


  def self.toCSV
      attributes = %w{tag name common_name habitat_num species sex dob age weight neutered notes instructions am pm dish}
      # dietAttributes = %w{instructions am pm dish}
      
      CSV.generate(headers: true) do |csv|
          csv << attributes
          # csv << dietAttributes
          
          all.each do |animal|
              # csv << animal.attributes.values_at(*attributes)
              csv << attributes.map{ |attr| animal.send(attr) }
          end
      end
  end
  
  def instructions
      diet.instructions
  end
  def am
      diet.am
  end
  def pm
      diet.pm
  end
  def dish
      diet.dish
  end
    
end
