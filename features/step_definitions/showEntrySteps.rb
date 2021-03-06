Given("the following Animal table") do |table|
  for row in table.rows do
    Animal.create!(habitat_num: row[0], common_name: row[1], name: row[2], tag: row[3])
  end
end

Given("I am on the Oak Creek home page") do
  visit animals_path
end

When("I follow the link {string}") do |string|
  click_link string
  wait_for_ajax
end

Then("I should be on the {string} page") do |string|
  page.should have_content("#{string}") 
end