

Given("the following exists") do |table|
  @animals = Animal.create!(exhibit: table.rows[0][0], commonName: table.rows[0][1])
end

Given("I am on the Oak Creek home page") do
    visit animals_path
end

When("I follow the link {string}") do |string|
    within_table('animals') do
        click_link string
    end
end

Then("I should be on the {string} page") do |string|
  page.should have_content("Details about #{string}") 
end
