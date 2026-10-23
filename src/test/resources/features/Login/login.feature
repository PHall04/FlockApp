@Login
Feature: User Login
  As a registered user
  I want to log in to FlockApp
  So that I can access my account

  Background:
    Given I am on the FlockApp login page

  @HappyPath @smoke
  Scenario: Successful login attempt
    When I enter a valid email address
    And I enter a valid password
    And I click the login button
    Then I should be redirected to the home page

  @HappyPath
  Scenario Outline: Testing selection of usernames
    When I enter a valid email which is "<username>"
    And I enter a valid password
    And I click the login button
    Then I should be redirected to the home page

    Examples:
      | username |
      | nish     |
      | NISH     |
      | NiSh     |
      | nIsH     |

  @SadPath
  Scenario Outline: Incorrect password attempt
    When I enter a valid email but the password is "<incorrect>"
    Then after I have clicked login I should see an error message saying "Incorrect username or password"
    And I should remain on the login page

    Examples:
      | incorrect     |
      | wrongpassword |
      | password123   |
      | incorrect     |
      | abc           |
      | MANDAL        |
      | mandal!       |

  @SadPath
  Scenario: Empty email and password
    When I enter a empty email
    And I enter a empty password
    And I click the login button
    Then I should get an username error saying "Please enter your username"
    And I should get an password error saying "Please enter your password"
    And I should remain on the login page

  @SadPath
  Scenario: Valid email and empty password
    When I enter a valid email address
    And I enter a empty password
    And I click the login button
    Then I should get an password error saying "Please enter your password"
    And I should remain on the login page

  @SadPath
  Scenario: empty email and valid password
    When I enter a empty email
    And I enter a valid password
    And I click the login button
    Then I should get an username error saying "Please enter your username"
    And I should remain on the login page

  @HappyPath
  Scenario: navigating backwards should redirect me to the homepage
    When I enter a valid email address
    And I enter a valid password
    And I click the login button
    Then I should be redirected to the home page
    When I navigate back
    Then I should be redirected to the home page
