require './features/support/helpers'

Then("I should see {string}") do |string|
  page.should have_content string
end

Then("I should not see {string}") do |string|
  page.should have_no_content string
end

When("I search for {string}") do |string|
  find(:css, 'input[type="search"]').set(string)
  wait_for_ajax
end