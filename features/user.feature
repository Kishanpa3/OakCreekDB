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
    When I sort by "FIRST NAME" on the table "userTable"
    Then I should see "Jimmy" in the first table row of "userTable"
    When I sort by "LAST NAME" on the table "userTable"
    When I sort by "LAST NAME" on the table "userTable"
    Then I should see "User" in the first table row of "userTable"
    When I sort by "EMAIL" on the table "userTable"
    Then I should see "User" in the first table row of "userTable"


Scenario: Editing User Profile as an Admin
    Then I should see "All Animals"
    Then I follow the link "Admin Dashboard"
    When I sort by "LAST NAME" on the table "userTable"
    When I sort by "LAST NAME" on the table "userTable"
    Then I should see "McUserFace" in the first table row of "userTable"
    Then I click on the first table row of "userTable"
    Then I should see "Created:" within the modal "#modalContainer"
    Given I fill text field "First Name" with "Felipe" within the modal "#modalContainer"
    And I press the button "Update" within the modal "#modalContainer"
    Given I am on the Oak Creek home page
    Then I follow the link "Admin Dashboard"
    Then I should see "Felipe" in the table "userTable"
    
# # This test is really finicky (works some times) - seems like Capybara has trouble accepting confirms?
# Scenario: Deleting User Profile as an Admin
#     Then I should see "All Animals"
#     Then I follow the link "Admin Dashboard"
#     When I sort by "Last Name" on the table "userTable"
#     When I sort by "Last Name" on the table "userTable"
#     Then I should see "McUserFace" in the first table row of "userTable"
#     Then I click on the first table row of "userTable"
#     Then I should see "Created:" within the modal "#modalContainer"
#     Given I follow the link "Delete" and confirm within the modal "#modalContainer"
#     Then I should see "User 'User McUserFace' successfully deleted."
#     Given I am on the Oak Creek home page
#     Then I follow the link "Admin Dashboard"
#     Then I should not see "McUserFace" in the table "userTable"
    
    
Scenario: No Admin Dashboard
    Given I am signed out
    Given I have registered a user with the credentials "Plain" "User" "plain_user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "User" with the email "plain_user@email.com" and the password "abc123"
    Then I should see "All Animals"
    And I should not see "Admin Dashboard"
    
    
Scenario: Editing User Profile
    Given I am signed out
    Given I have registered a user with the credentials "Plain" "User" "plain_user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "User" with the email "plain_user@email.com" and the password "abc123"
    Given I visit the profile page for "Plain User"
    Then I should see "Edit User"
    And I should see "Delete Account"
    Given I fill text field "First name" with "Edited"
    And I fill text field "Last name" with "Name"
    And I fill text field "Current password" with "abc123"
    And I press the button "Update"
    Then I should see "Your account has been updated successfully."
    Then I should see "Edited Name"
    
    
Scenario: Deleting User Profile
    Given I am signed out
    Given I have registered a user with the credentials "Plain" "User" "plain_user@email.com" "abc123"
    Given I am on the User login page
    Given I sign in as an "User" with the email "plain_user@email.com" and the password "abc123"
    Given I visit the profile page for "Plain User"
    Given I press the button "Delete my account"
    Then I should see "You need to sign in or sign up before continuing."
    Given I sign in as an "Admin" with the email "user@email.com" and the password "abc123"
    Then I follow the link "Admin Dashboard"
    Then I should not see "plain_user@email.com" in the table "userTable"
