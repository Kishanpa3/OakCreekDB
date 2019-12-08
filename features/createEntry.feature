@javascript
Feature: Create an Animal Entry
    As a user
    So that I can add animals to the database
    I want to create new animal entries in the database


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"

    Given I am on the Oak Creek home page


Scenario: Create Animal
    When I follow the link "Add New Animal"
    Then I should see "Create New Animal"
    When I fill text field "Tag" with "1337"
    And I fill text field "Name" with "Scott"
    And I fill text field "Common Name" with "Chinchilla"
    And I fill text field "Habitat #" with "12345"
    And I fill text field "Species" with "Crimson Chin"
    And I fill text field "Weight" with "50"
    And I fill text field "Date of Birth" with "01202016"
    And I select the option "Yes" from "Neutered" field
    And I select the option "lbs" from "Weight Units" field
    And I select the option "Male" from "Sex" field
    When I press the button "Save New Animal"
    Then I should see "All Animals"
    When I click on the first table row of "dtSearch"
    Then I should see "Scott"
    And I should see "Yes"
    And I should see "Chinchilla"