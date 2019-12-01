@javascript
Feature: Read a Diet Entry
    As a user
    So that I can obtain diet information about the animals
    I want to read diet entries associated with an animal


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
        | 70            | Panda Bear    | Cleetus   |
    
    
    Given I am on the Oak Creek home page
    
    
Scenario: Try to read an existing diet
    Given the following Diet table
        | Dish              | Animal Name   |
        | Black Bowl        | Otto          |
    When I click on the first table row of "dtSearch"
    Then I should be on the "Otto" page
    When I click on the "Diet" tab
    Then I should see "Black Bowl"
    
Scenario: Try to read a diet that doesn't exist in diets table
    When I click on the first table row of "dtSearch"
    Then I should be on the "Otto" page
    When I click on the "Diet" tab
    Then I should see "Dish"