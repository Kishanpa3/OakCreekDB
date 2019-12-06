class AnimalProfileImage < ApplicationRecord
  belongs_to :animal, :document
end