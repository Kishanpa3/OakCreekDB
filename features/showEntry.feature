@javascript
Feature: Read an Animal Entry
    As a user
    So that I can obtain information about the animals
    I want to read animal entries from the database


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      | Tag     |
        | 32            | Brown Bear    | Otto      | ab12    |
        | 70            | Panda Bear    | Cleetus   | cd34    |
    
    Given I am on the Oak Creek home page
    
    
Scenario: Try to read entry
    When I click on the first table row of "dtSearch"
    Then I should be on the "Otto" page
    