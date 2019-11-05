class Animal < ApplicationRecord
    has_one :diet
    #validates :tag, presence: true
    #validates :sex, length: {minimum: 6}
    #validates :neutered, length: {minimum: 3}
end
