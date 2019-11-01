Capybara.default_driver = :selenium

Given("the following exists") do |table|
  for row in table.rows do
    Animal.create!(habitat_num: row[0], common_name: row[1], name: row[2])
  end
end

Given("I am on the Oak Creek home page") do
  visit animals_path
end

When("I follow the link {string}") do |string|
  click_link string
end

Then("I should be on the {string} page") do |string|
  page.should have_content("Details about #{string}") 
end
