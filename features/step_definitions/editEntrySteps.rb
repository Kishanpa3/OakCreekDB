

When("I fill text field {string} with {string}") do |string, string2|
  fill_in(string, with: string2)
end

When("I press the button {string}") do |string|
  click_button string
end