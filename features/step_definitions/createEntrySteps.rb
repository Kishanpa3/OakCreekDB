
When("I select the option {string} from {string} field") do |string, string2|
  select(string, from: string2)
end


When("I click on the first table row of {string}") do |_table|
   within_table(_table) do
     find('tbody').first('tr').click()
   end
   wait_for_ajax
end