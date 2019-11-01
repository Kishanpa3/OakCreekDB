@javascript
Feature: Index the database
    As a user
    So I can have a high-level overview of the database.
    I want to see all the entries in my database
    
Background: Database Setup
    Given the following exists
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
    Given I am on the Oak Creek home page 


Scenario: Index Entries
    Then I should see "All Animals"
    And I should see "32"
    And I should see "Brown Bear"
    And I should see "Otto"