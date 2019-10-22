# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

animals = Animal.create([   {habitat_num:"32", common_name:"Brown Bear", name:"Otto", tag: "BBO001", species: "Ursus Arctos", weight: 325, sex: "Male", neutered: "Yes", age: 3, dob: Time.new(2016,1,20) },
                            {habitat_num:"30", common_name:"Raccoon", name:"Larry", tag: "RCC001"}])