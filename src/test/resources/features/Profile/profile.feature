@profile
Feature: User profile
  As a Flock user
  I want to view and manage my profile
  So that my details and interests are up to date

  Background:
    Given I am on the FlockApp login page
    When I enter a valid email address
    And I ender a valid password
    And I click the login button


  @smoke
  Scenario: Profile header shows the user's details
    Then I should see the profile name "Nish Mandal"
    And I should see the profile details "26 years old · Edinburgh"
    And I should see the "Edit profile" button

  Scenario: Edit profile opens the edit form
    When I click "Edit profile"
    Then the edit profile form should be displayed


  Scenario: Stats show flocks joined and interests selected
    Then the "Flocks joined" stat should be 4
    And the "Interests selected" stat should be 7

  Scenario: Interests selected matches the highlighted interests
    Then the "Interests selected" stat should equal the number of selected interests

  # ---------- Preferences ----------

  Scenario: Current city is shown in the preferences
    Then the City preference should be "Edinburgh"

  Scenario: Changing the city updates the profile
    When I change the City preference to "Glasgow"
    Then the City preference should be "Glasgow"
    And the profile details should include "Glasgow"

  # ---------- My Interests ----------

  Scenario: Selected interests are highlighted
    Then the following interests should be selected:
      | Football      |
      | Gym & Fitness |
      | Food & Dining |
      | Pub & Social  |
      | Cinema        |
      | Swimming      |
      | Dancing       |

  Scenario Outline: Adding an interest
    Given the interest "<interest>" is not selected
    When I tap the interest "<interest>"
    Then the interest "<interest>" should be selected
    And the "Interests selected" stat should increase by 1

    Examples:
      | interest     |
      | Rugby        |
      | Running      |
      | Board Games  |

  Scenario Outline: Removing an interest
    Given the interest "<interest>" is selected
    When I tap the interest "<interest>"
    Then the interest "<interest>" should not be selected
    And the "Interests selected" stat should decrease by 1

    Examples:
      | interest      |
      | Football      |
      | Cinema        |

  Scenario: Interest changes are saved
    When I tap the interest "Rugby"
    And I refresh the page
    Then the interest "Rugby" should be selected

  # ---------- Account ----------

  Scenario: Account section shows the username
    Then the Username should be "nish"

  # ---------- Navigation ----------

  Scenario: Profile is highlighted in the sidebar
    Then "Profile" should be the active sidebar item

  Scenario Outline: Sidebar links open the correct page
    When I click "<link>" in the sidebar
    Then I should be on the "<page>" page

    Examples:
      | link      | page      |
      | Roosts    | Roosts    |
      | Flocks    | Flocks    |
      | My Flocks | My Flocks |
      | My Roosts | My Roosts |
      | About     | About     |
      | Chats     | Chats     |

  # ---------- Sign out ----------

  Scenario Outline: Signing out from the profile page
    When I click the "<button>" sign out button
    Then I should be signed out
    And I should be on the login page

    Examples:
      | button  |
      | page    |
      | sidebar |