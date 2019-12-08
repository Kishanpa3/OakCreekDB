class Animal < ApplicationRecord
  has_one :diet, dependent: :destroy
  has_one :animal_profile_image, dependent: :destroy
  accepts_nested_attributes_for :diet, allow_destroy: true
  
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true
  validates_associated :documents
  
  # before_validation :downcase_fields
  
  validates :tag, uniqueness: { case_sensitive: false }
  validates :tag, presence: true
  validates :habitat_num, numericality: { only_integer: true, allow_nil: true }
  validates :weight, numericality: { allow_nil: true }
  validates :common_name, format: { with: /\A[a-zA-Z\-]+( +[a-zA-Z\-]+)*\z/,
    message: "only allows letters and dashes", allow_nil: true }
  validates :species, format: { with: /\A[a-zA-Z\.]+( +[a-zA-Z\.]+)*\z/,
  message: "only allows letters", allow_nil: true }
  # validates :name, format: { with: /\A[a-zA-Z\-\.]+( +[a-zA-Z\-\.]+)*\z/,
  # message: "only allows letters", allow_nil: true }
  # validates :tag, format: { with: /\A[a-zA-Z0-9]+\z/,
  # message: "only allows letters and numbers" }
  # validates :sex, inclusion: { in: %w(male female n/a), allow_nil: true }
  # validates :neutered, inclusion: { in: %w(yes no n/a), allow_nil: true }
  # validates :weight_units, inclusion: { in: %w(g kg lbs), allow_nil: true }
  
  # include ImageUploader::Attachment(:profile_pic)  # ImageUploader will attach and manage `profile_pic`

  # def downcase_fields
  #   self.sex.downcase
  #   self.neutered.downcase
  #   self.weight_units.downcase
  # end
  
  def self.toCSV
      attributes = %w{tag name common_name habitat_num species sex dob age weight weight_units neutered notes instructions am pm dish}
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
  
  def age
    unless dob.nil?
      years = ((Time.zone.now + Time.zone_offset('CST') - dob.to_time) / 1.year.seconds).floor
      months = ((Time.zone.now + Time.zone_offset('CST') - dob.to_time) / 1.month.seconds).floor
      days = ((Time.zone.now + Time.zone_offset('CST') - dob.to_time) / 1.day.seconds).floor
      seconds = (Time.zone.now + Time.zone_offset('CST') - dob.to_time)
      if years > 0
        years = "#{years} Year(s)"
      elsif months > 0
        months = "#{months} Month(s)"
      elsif days > 0
        days = "#{days} Day(s)"
      elsif seconds > 0
        "0 Day(s)"
      else
        "Not Yet Born"
      end
    else
        ""
    end
  end
    
end
