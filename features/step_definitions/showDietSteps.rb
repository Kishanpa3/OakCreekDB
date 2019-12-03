

Given("the following Diet table") do |table|
  for row in table.rows do
    @animal = Animal.find(1)
    @animal.diet = Diet.create(dish: row[0])
    
  end
end

When("I click on the {string} tab") do |string|
  click_link string
end