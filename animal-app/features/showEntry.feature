Feature: Read an Animal Entry
    As a user
    So that I can obtain information about the animals
    I want to read animal entries from the database
    
Scenario: Try to read entry
    Given the following exists
        | Exhibit       | Common Name   |
        | 32            | Brown Bear    |
    Given I am on the Oak Creek home page    
    When I follow the link "More about Brown Bear"
    Then I should be on the "Brown Bear" page
    