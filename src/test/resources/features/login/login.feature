Feature: User Login
  As a registered user
  I want to log in to FlockApp
  So that I can access my account

  Background:
    Given I am on the FlockApp login page

Scenario:
  When I enter a valid email address
  And I ender a valid password
  And I click the login button
  Then I should be redirected to the home page

Scenario Outline:
  When I enter a valid email but the password is "<incorrect>"
  Then after I have clicked login I should see an error message saying "Incorrect username or password"
  And I should remain on the login page
  Examples:
    | incorrect |
    | wrongpassword |
  |password123 |
  | incorrect  |
  |abc |
  |MANDAL|
  |mandal!|