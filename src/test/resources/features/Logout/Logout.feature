@Logout
Feature: Logout

  As a logged-in user,
  I want to log out of my account,
  So that I can securely end my session.

  Background:
    Given I am on the FlockApp login page
    When I enter a valid email address
    And I enter a valid password
    And I click the login button

  @HappyPath @smoke
  Scenario: Log out from the current page
    When I click the logout button on the current page
    Then I should be returned to the login page
