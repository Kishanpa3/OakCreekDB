Feature: Create an Animal Entry
    
    
    
Scenario: Create Animal
  Given I am on the Oak Creek home page
  When I follow the link "Add new animal"
  Then I should see "Create New Animal"
  When I fill text field "Tag" with "1337"
  And I fill text field "Name" with "Scott"
  And I fill text field "Common Name" with "Chinchilla"
  And I select the option "Yes" from "Neutered" field
  When I press the button "Save New Animal"
  When I follow the link "More about Scott"
  Then I should see "Scott"
  And I should see "Yes"
  And I should see "Chinchilla"