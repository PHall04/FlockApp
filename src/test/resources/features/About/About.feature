@About
Feature: About Flock
  As a new or existing user
  I want to read information about Flock
  So that I can understand how Flocks and Roosts work

  @HappyPath @smoke
  Scenario: Access the About page as a guest
    Given I am on the FlockApp login page
    When I click the What is Flock link
    Then I should be redirected to the About page

  @HappyPath
  Scenario: Access the About page as a logged-in user
    Given I am logged into FlockApp
    And I am on the home page
    When I click About in the sidebar
    Then I should be redirected to the About page

  @HappyPath
  Scenario: View About page information
    Given I am on the About page
    Then I should see information about Flocks and Roosts
    And I should see how Flock works

  @HappyPath
  Scenario: Browse Roosts from the About page
    Given I am logged into FlockApp
    And I am on the About page
    When I click the Browse Roosts button
    Then I should be redirected to the home page

  @HappyPath
  Scenario: Browse Roosts as a guest
    Given I am on the About page as a guest
    When I click the Browse Roosts button
    Then I should be redirected to the login page
