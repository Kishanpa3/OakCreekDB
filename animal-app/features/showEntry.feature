@javascript
Feature: Read an Animal Entry
    As a user
    So that I can obtain information about the animals
    I want to read animal entries from the database

    
Scenario: Try to read entry
    Given the following exists
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
    Given I am on the Oak Creek home page    
    When I click on the table row
    Then I should be on the "Otto" page
    