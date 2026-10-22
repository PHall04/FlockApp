Feature: User Registration
  As a new FlockApp user
  I want to create an account
  So that I can access the FlockApp

  Background:
    Given I am on the FlockApp login page
    When I click the sign up link
    Then I should be redirected to the signup page

  @HappyPath
  Scenario: Successfully create an account with valid details
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "johnsmith123" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should be created successfully


  @SadPath
  Scenario: Attempt to register with all fields empty
    When I click the Create Account button
    Then my account should not be created
    And I should see the first name error "Please enter your first name"
    And I should see the username error "Username must be at least 3 characters"
    And I should see the password error "Password must be at least 6 characters"
