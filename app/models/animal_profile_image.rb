class AnimalProfileImage < ApplicationRecord
  belongs_to :animal
  belongs_to :document
end