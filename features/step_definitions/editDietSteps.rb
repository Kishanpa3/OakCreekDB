When("I fill text area {string} with {string}") do |string, string2|
  page.execute_script %Q{ $('#diet_dish').data("wysihtml5").editor.setValue("#{string2}") }
end