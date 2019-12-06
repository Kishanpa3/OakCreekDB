@javascript
Feature: Edit a Diet Entry
    As a user
    So that I can have up to date diet information about the animals
    I want to edit diet entries associated with an animal


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
        | 70            | Panda Bear    | Cleetus   |
    
    
    Given I am on the Oak Creek home page
    
    
Scenario: Try to edit an existing diet
    Given the following Diet table
        | Dish              | Animal Name   |
        | Black Bowl        | Otto          |
    When I click on the first table row of "dtSearch"
    Then I should be on the "Otto" page
    When I click on the "Diet" tab
    When I follow the link "Edit Diets"
    When I fill text field "Dish" with "Blue Bowl"
    When I fill text area "#diet_instructions" with "Blue goldfish"
    When I press the button "Update Diets"
    Then I should see "Diet was successfully updated."
    Then I should see "Blue Bowl"
    And I should see "Blue goldfish"