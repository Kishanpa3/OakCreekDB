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
    When I click on the first table row of "dtSearch"
    When I follow the link "Edit Details"
    Then I should see "Editing Otto's Information"
    When I fill text field "Tag" with "1337"
    And I fill text field "Weight" with "570"
    When I fill text field "Tag" with "1337"
    And I fill text field "Name" with "Scott"
    And I fill text field "Common Name" with "Chinchilla"
    And I fill text field "Habitat #" with "12345"
    And I fill text field "Species" with "Crimson Chin"
    And I fill text field "Age" with "10"
    And I fill text area "#animal_notes" with "Hello World"
    And I select the option "Yes" from "Neutered" field
    And I select the option "Male" from "Sex" field
    And I fill text field "Date of Birth" with "01202016"
    When I press the button "Update Details"
    Then I should see "1337 was successfully updated."
    Then I should see "Hello World"
    Then I should see "1337"
    And I should see "570"