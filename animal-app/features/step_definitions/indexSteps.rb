

Then("I should see {string}") do |string|
  page.should have_content string
end

Then("I should not see {string}") do |string|
  page.should have_no_content string
end