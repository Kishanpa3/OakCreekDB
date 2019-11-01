
When("I select the option {string} from {string} field") do |string, string2|
  select(string, from: string2)
end


When("I click on the table row") do
   within_table('dtSearch') do
     find('tbody').find('tr').click()
   end
end