Feature: User Login
  As a registered user
  I want to log in to FlockApp
  So that I can access my account

  Background:
    Given I am on the FlockApp login page

Scenario:
  When I enter a valid email address
  And I enter a valid password
  And I click the login button
  Then I should be redirected to the home page
