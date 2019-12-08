# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# animals = Animal.create([{habitat_num:"32", common_name:"Brown Bear"}, {habitat_num:"30", common_name:"Raccoon"}])


require 'securerandom' # used for generating a random hex tag - (https://stackoverflow.com/questions/88311/how-to-generate-a-random-string-in-ruby)

puts 'STARTING TO SEED'
  file = File.open("animals.txt")
  list_of_animals = file.readlines.map(&:chomp)
  file.close
  file = File.open("names.txt")
  list_of_names = file.readlines.map(&:chomp)
  file.close
  
  Animal.delete_all
  rand_habitat = rand(10000..100000)
  for i in 0..list_of_animals.length-1 do
    Animal.create(:tag => SecureRandom.hex, :name => list_of_names[i], :common_name => list_of_animals[i], :habitat_num => rand_habitat, :dob => Time.new(2016,1,20))
    rand_habitat = (rand_habitat % 69 == 0) ? rand(10000..100000) : rand_habitat + rand(10000..100000)
  end
puts 'DONE SEEDING'

Animal.create([   {habitat_num:"32", common_name:"Brown Bear", name:"Otto", tag: "BBO001", species: "Ursus Arctos", weight: 325, sex: "Male", neutered: "Yes", dob: Time.new(2016,1,20) },
                  {habitat_num:"30", common_name:"Raccoon", name:"Gracie", tag: "RCC001", species: "Procyon lotor megalodous", weight: 12, sex: "Female", neutered: "Yes", dob: Time.new(2014,4,15)}  ])