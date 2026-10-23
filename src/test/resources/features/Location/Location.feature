Feature: Home page location-based discovery
  As a signed in user
  I want to discover Roosts based on my location
  So that I can find relevant activities and gatherings nearby

  Background:
    Given I am on the FlockApp login page
    When I enter a valid email address
    And I enter a valid password
    And I click the login button

  @HappyPath
  Scenario: Use location-based discovery
    Given browser geolocation permission is granted
    When I select Use my location
    Then the application should attempt to use my location
    And the displayed results should reflect location if supported

  @SadPath
  Scenario: Deny location permission
    Given browser geolocation permission is denied
    When I select Use my location
    Then the application should handle the denial gracefully