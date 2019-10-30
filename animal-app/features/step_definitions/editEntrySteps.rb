

When("I edit {string} to be {string}") do |string, string2|
  fill_in(string, with: string2)
end

When("I press the button {string}") do |string|
  click_button string
end