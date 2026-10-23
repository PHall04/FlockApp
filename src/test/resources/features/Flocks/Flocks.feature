@Flocks
Feature: Discover Flocks
  As a FlockApp user
  I want to search, filter and sort Flocks
  So that I can discover communities that interest me

  Background:
    Given I am logged into FlockApp
    And I am on the FlockApp Flocks page

  @HappyPath @smoke
  Scenario: View available Flock categories
    Then I should see the following Flock categories:
      | All          |
      | Sports       |
      | Food & Drink |
      | Gaming       |
      | Fitness      |
      | Social       |
      | Wellness     |
      | Outdoors     |
      | Music        |
      | Arts         |

  @HappyPath
  Scenario: Select a Flock category
    When I select the "Gaming" Flock category
    Then the "Gaming" Flock category should be active

  @HappyPath
  Scenario: Return to all Flock categories
    Given I select the "Sports" Flock category
    When I select the "All" Flock category
    Then the "All" Flock category should be active

  @HappyPath
  Scenario: Search for a Flock
    When I search for "Gaming" on the Flocks page
    Then the Flock search field should contain "Gaming"

  @HappyPath
  Scenario: Clear a Flock search
    Given I search for "Gaming" on the Flocks page
    When I clear the Flock search
    Then the Flock search field should be empty

  @HappyPath
  Scenario Outline: Sort Flocks
    When I sort Flocks by "<sortOption>"
    Then the selected Flock sort option should be "<sortOption>"

    Examples:
      | sortOption   |
      | Most members |
      | Next Roost   |
      | A - Z        |

  @HappyPath
  Scenario: Filter Flocks by an available city
    When I select an available Flock city
    Then the selected Flock city should be applied

  @HappyPath
  Scenario: View Flock details by clicking a card
    Given I can see available Flock cards
    When I click on the first Flock card
    Then I should be redirected to the Flock details page

  @SadPath
  Scenario: Search for a Flock that does not exist
    When I search for "zzzznonexistentflock12345" on the Flocks page
    Then no matching Flock cards should be displayed

  @SadPath
  Scenario: Clear a search that returns no results
    Given I search for "zzzznonexistentflock12345" on the Flocks page
    When I clear the Flock search
    Then the Flock search field should be empty
