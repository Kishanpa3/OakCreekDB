
When("I select the option {string} from {string} field") do |string, string2|
  select(string, from: string2)
end


When("I click on the first table row") do
   wait_for_ajax
   
   within_table('dtSearch') do
     find('tbody').first('tr').click()
   end
end