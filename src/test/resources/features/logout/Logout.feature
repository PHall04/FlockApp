Feature: Logout

  As a logged-in user,
  I want to log out of my account,
  So that I can securely end my session.

  Background:
    Given i am logged in on the flockApp


  Scenario: Logged-in User
    When i click the logout button on the current page
    Then i should be returned to the login page
