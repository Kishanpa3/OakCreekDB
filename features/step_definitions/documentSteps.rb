Given("I click the download button") do |string|
  click_link 'Download'
end

Then(/^I should receive a file(?: "([^"]*)")?/) do |file|
  result = page.response_headers['Content-Type'].should == "application/octet-stream"
  if result
    result = page.response_headers['Content-Disposition'].should =~ /#{file}/
  end
  result
end

Given("I delete a document using the dropdown option") do |string|
  find('.dropdown-ellipses').click.click_link('Delete')
end