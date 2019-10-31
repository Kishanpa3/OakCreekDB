Feature: Delete an Animal Entry
    As a user
    So that I can delete information about the animals
    I want to delete animal entries from the database
    
Scenario: Try to delete entry
    Given the following exists
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
    Given I am on the Oak Creek home page    
    When I follow the link "More about Otto"
    When I follow the link "Delete"
    Then I should see "Entry for Brown Bear 'Otto' deleted."