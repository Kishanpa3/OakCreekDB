class Animal < ApplicationRecord
    has_one :diet, dependent: :destroy
    #validates :tag, presence: true
    #validates :sex, length: {minimum: 6}
    #validates :neutered, length: {minimum: 3}
end
