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

When("I sort by {string} on the table {string}") do |string, _table|
  # within_table _table do
  within first('table.dataTable') do
    find('th', text: string, match: :prefer_exact).click()
  end
  wait_for_ajax
end

Then("I should see {string} in the first table row of {string}") do |string, _table|
  within_table _table do
    first_row = find('tbody').first('tr')
    first_row.should have_content string
  end
end

Then("I should not see {string} in the first table row of {string}") do |string, _table|
  within_table _table do
    first_row = find('tbody').first('tr')
    first_row.should have_no_content string
  end
end

Then("I should see {string} in the table {string}") do |string, _table|
  within_table _table do
    table_body = find('tbody')
    table_body.should have_content string
  end
end

Then("I should not see {string} in the table {string}") do |string, _table|
  within_table _table do
    table_body = find('tbody')
    table_body.should have_no_content string
  end
end