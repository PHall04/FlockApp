Feature: User Onboarding
  As a newly registered FlockApp user
  I want to complete the onboarding process
  So that I can personalise my experience

  Background:
    Given I am on the FlockApp signup page
    When I register a new account with first name "John" and last name "Smith"
    Then I should be redirected to the onboarding page

  @Onboarding @HappyPath @smoke
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


  @Onboarding @SadPath
  Scenario: Attempt to continue without a first name
    When I clear the first name field
    And I enter "2000-01-15" as my date of birth
    And I click the Continue button
    Then I should see an alert "Please enter your first name"
    And I should remain on onboarding step 1


  @Onboarding @SadPath
  Scenario: Attempt to continue without a date of birth
    When I clear the date of birth field
    And I click the Continue button
    Then I should see an alert "Please enter your date of birth"
    And I should remain on onboarding step 1


  @Onboarding @SadPath
  Scenario: Attempt to continue without a first name or date of birth
    When I clear the first name field
    And I clear the date of birth field
    And I click the Continue button
    Then I should see an alert "Please enter your first name"
    And I should remain on onboarding step 1


  @Onboarding @SadPath
  Scenario: Attempt to continue without selecting an interest
    Given I have completed onboarding step 1
    When I click the Continue button
    Then I should see an alert "Please select at least one interest"
    And I should remain on onboarding step 2


  @Onboarding @SadPath
  Scenario: Attempt to continue after deselecting all interests
    Given I have completed onboarding step 1
    When I select "Rugby" as an interest
    And I deselect "Rugby" as an interest
    And I click the Continue button
    Then I should see an alert "Please select at least one interest"
    And I should remain on onboarding step 2


  @Onboarding @HappyPath
  Scenario: Continue without entering a last name
    When I clear the last name field
    And I enter "2000-01-15" as my date of birth
    And I click the Continue button
    Then I should be on onboarding step 2


  @Onboarding @HappyPath
  Scenario: Continue with the default avatar
    When I enter "2000-01-15" as my date of birth
    And I click the Continue button
    Then I should be on onboarding step 2


  @Onboarding @HappyPath
  Scenario: Continue without joining a suggested Flock
    Given I have completed onboarding steps 1 and 2
    When I click the Continue button
    Then I should be on onboarding step 4


  @Onboarding @HappyPath
  Scenario: Complete onboarding using default preferences
    Given I have completed onboarding steps 1 to 3
    When I click the Continue button
    Then I should be redirected to the home page
