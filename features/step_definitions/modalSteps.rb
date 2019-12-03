Given("I should see {string} within the modal {string}") do |string, _modal|
  within(_modal) do
    # puts page.html
    page.should have_content(string)
  end
end

Given("I fill text field {string} with {string} within the modal {string}") do |string, text, _modal|
  # puts page.html
  within(_modal) do
    fill_in(string, with: text)
  end 
end

Given("I follow the link {string} and confirm within the modal {string}") do |string, _modal|
  within(_modal) do
    # accept_confirm do
      click_link string
      wait_for_ajax
    # end
  end 
end

Given("I press the button {string} within the modal {string}") do |string, _modal| 
  within(_modal) do
    click_button string
  end
end