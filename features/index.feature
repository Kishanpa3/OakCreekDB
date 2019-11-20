@javascript
Feature: Index the database
    As a user
    So I can have a high-level overview of the database.
    I want to see all the entries in my database


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
        | 70            | Panda Bear    | Cleetus   |
    
    Given I am on the Oak Creek home page
    
    
Scenario: Index Entries
    Then I should see "All Animals"
    And I should see "32"
    And I should see "Brown Bear"
    And I should see "Otto"
    And I should see "70"
    And I should see "Panda Bear"
    And I should see "Cleetus"
    
Scenario: Search Entries
    When I search for "James"
    Then I should not see "Cleetus"
    And I should not see "Otto"
    When I search for "CLEETUS"
    Then I should see "Cleetus"
    And I should not see "Otto"
    
Scenario: Sort Entries
    When I sort by "Name" on the table "dtSearch"
    Then I should see "Cleetus" in the first table row of "dtSearch"
    When I sort by "Habitat #" on the table "dtSearch"
    Then I should see "32" in the first table row of "dtSearch"
    When I sort by "Common Name" on the table "dtSearch"
    When I sort by "Common Name" on the table "dtSearch"
    Then I should see "Panda Bear" in the first table row of "dtSearch"