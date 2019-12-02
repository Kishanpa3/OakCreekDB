require 'faker'

FactoryBot.define do
  factory :animal do
    habitat_num {"32"} 
    common_name {"Brown Bear"} 
    name {"Otto"} 
    tag {"BBO001"} 
    species {"Ursus Arctos"}
    weight {325}
    sex {"Male"} 
    neutered {"Yes"} 
    age {3} 
    dob {Time.new(2016,1,20)}
  end
end