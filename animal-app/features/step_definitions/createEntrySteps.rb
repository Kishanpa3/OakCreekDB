
When("I select the option {string} from {string} field") do |string, string2|
  select(string, from: string2)
end