Feature: Update an animal Entry
    As a user
    So that I can update information about the animals
    I want to update animal entries in the database
    
Scenario: Edit an existing animal
    Given the following exists
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
    Given I am on the Oak Creek home page
    When I follow the link "More about Otto"
    When I follow the link "Edit"
    Then I should see "Edit Existing Animal"
    When I fill text field "Tag" with "1337"
    And I fill text field "Weight" with "570"
    When I press the button "Update Animal Info"
    Then I should see "1337"
    And I should see "570"