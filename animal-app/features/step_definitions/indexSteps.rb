

Then("I should see {string}") do |string|
  page.should have_content string
end
