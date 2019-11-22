
When("I fill text field {string} with {string}") do |string, string2|
  fill_in(string, with: string2)
end

When("I press the button {string}") do |string|
  wait_for_ajax
  click_button string
end


When("I fill text area {string} with {string}") do |string, string2|
  wait_for_ajax
  #fill_in(string, with: string2)
  within('#dish_area') do
    el = find(:xpath, "//body[@class='wysihtml5 wysihtml5-editor']")
    el.send_keys(string2)
    expect(page).to have_content("Black Bowl")
    expect(page).to have_content(string2)
  end
end