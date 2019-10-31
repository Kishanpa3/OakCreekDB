

Given("the following exists") do |table|
  @animals = Animal.create!(habitat_num: table.rows[0][0], common_name: table.rows[0][1], name: table.rows[0][2])
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
