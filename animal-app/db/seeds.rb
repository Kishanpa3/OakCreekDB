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
  Animal.delete_all
  habitat = rand(10000..100000)
  open('animals.txt') do |animals|
    animals.read.each_line do |animal|
      # puts animal
      Animal.create(:habitat_num => habitat, :common_name => animal, :tag => SecureRandom.hex)
      habitat = (habitat % 69 == 0) ? rand(10000..100000) : habitat + rand(10000..100000)
    end
  end
puts 'DONE SEEDING'