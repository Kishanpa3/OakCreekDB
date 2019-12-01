@javascript
Feature: Create a user with permissions
    As a user
    So I can have access to specific actions on the website
    I want to be able to create a user
   
   
    So I can have a high-level overview of the database.
    I want to see all the entries in my database


Background: Database Setup
    Given I have registered a user with the credentials "Jimmy" "John" "user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    
    Given the following User table
        |   First Name  |   Last Name   |        Email        |     Password     |       Confirmed At       |   Approved    |
        |      User     |   McUserFace  |   dsfs@email.com    |      123456      |   2019-11-12 18:25:34    |     true      |
        |      Redd     |     Apple     |   fdlj@email.com    |      654321      |   2019-11-12 18:25:34    |     false     |
        |      Dder     |     Elppa     |   fdaf@email.com    |      321654      |                          |     false     |
    
    Given the following Animal table
        | Exhibit       | Common Name   | Name      |
        | 32            | Brown Bear    | Otto      |
        | 70            | Panda Bear    | Cleetus   |
    
    Given I am on the Oak Creek home page
    
    
Scenario: Admin Dashboard
    Then I should see "All Animals"
    Then I follow the link "Admin Dashboard"
    Then I should see "Approved Users"
    Then I should see "Jimmy" in the table "userTable"
    And I should see "McUserFace" in the table "userTable"
    And I should not see "Redd" in the table "userTable"
    When I follow the link "Unapproved Users"
    Then I should not see "Jimmy" in the table "userTable"
    And I should not see "McUserFace" in the table "userTable"
    And I should see "Redd" in the table "userTable"
    And I should not see "Dder" in the table "userTable"
    
    
Scenario: Sorting Admin Dashboard
    Then I should see "All Animals"
    Then I follow the link "Admin Dashboard"
    When I sort by "First Name" on the table "userTable"
    Then I should see "Jimmy" in the first table row of "userTable"
    When I sort by "Last Name" on the table "userTable"
    When I sort by "Last Name" on the table "userTable"
    Then I should see "User" in the first table row of "userTable"
    When I sort by "Email" on the table "userTable"
    Then I should see "User" in the first table row of "userTable"
    
    
Scenario: No Admin Dashboard
    Given I am signed out
    Given I have registered a user with the credentials "Plain" "User" "use123r@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "User" with the email "use123r@email.com" and the password "abc123"
    Then I should see "All Animals"
    And I should not see "Admin Dashboard"