require 'faker'

FactoryBot.define do
  factory :user do
    first_name {"Admin"}
    last_name {"Adminn"}
    email {Faker::Internet.unique.email}
    password              {"adminnn"}
    password_confirmation {"adminnn"}
    admin    {true}
    approved {true}
    confirmed_at {Time.zone.now}
  end
end