require 'faker'

FactoryBot.define do
  factory :animal do
    habitat_num {"32"} 
    common_name {"Brown Bear"} 
    name {"Otto"} 
    tag {"BBO001"} 
    species {"Ursus Arctos"}
    weight {325}
    weight_units {"lbs"}
    sex {"Male"} 
    neutered {"Yes"}
    dob {Time.new(2016,1,20)}
  end
end