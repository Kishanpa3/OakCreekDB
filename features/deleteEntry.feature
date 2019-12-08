@javascript
Feature: Delete an Animal Entry
    As a user
    So that I can delete information about the animals
    I want to delete animal entries from the database
 

Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      | Tag     |
        | 32            | Brown Bear    | Otto      | ab12    |
        | 70            | Panda Bear    | Cleetus   | cd34    |
    
    Given I am on the Oak Creek home page


Scenario: Try to delete entry
    When I click on the first table row of "dtSearch"
    When I follow the link "Delete"
    Then I should see "Entry for ab12 'Otto' was successfully deleted."