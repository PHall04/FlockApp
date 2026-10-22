
Feature: User Onboarding
  As a newly registered FlockApp user
  I want to complete the onboarding process
  So that I can personalise my experience

  Background:
    Given I am on the FlockApp signup page
    When I register a new account with first name "John" and last name "Smith"
    Then I should be redirected to the onboarding page

  @Onboarding @HappyPath
  Scenario: Successfully complete the onboarding process
    Then my first name should be "John"
    And my last name should be "Smith"

    When I enter "2000-01-15" as my date of birth
    And I select an avatar
    And I click the Continue button
    Then I should be on onboarding step 2

    When I select "Rugby" as an interest
    And I click the Continue button
    Then I should be on onboarding step 3

    When I click the Skip button
    Then I should be on onboarding step 4

    When I select "London" as my city
    And I select "25 miles" as my distance
    And I click the Continue button
    Then I should be redirected to the home page
