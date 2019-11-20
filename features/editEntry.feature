@javascript
Feature: Update an animal Entry
    As a user
    So that I can update information about the animals
    I want to update animal entries in the database


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
        | 70            | Panda Bear    | Cleetus   |
    
    Given I am on the Oak Creek home page
    
    
Scenario: Edit an existing animal
    When I click on the first table row
    When I follow the link "Edit"
    Then I should see "Edit Existing Animal"
    When I fill text field "Tag" with "1337"
    And I fill text field "Weight" with "570"
    When I press the button "Update Animal Info"
    Then I should see "1337"
    And I should see "570"