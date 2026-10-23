@Profile
Feature: User profile
  As a Flock user
  I want to view and manage my profile
  So that my details and interests are up to date

  Background:
    Given I am on the FlockApp login page
    When I enter a valid email address
    And I enter a valid password
    And I click the login button
    Then I open the profile page

  # ---------- Profile details ----------

  @HappyPath @smoke
  Scenario: Profile Details
    Then I should see the profile name "Nish Mandal"
    And I should see the profile details "26 years old · London"
    And I should see the "✎ Edit profile" button

  @HappyPath
  Scenario: Flocks and interests updates
    Then the Flocks joined stat should be 4 🎉
    And the Interests selected stat should be 7

  @HappyPath
  Scenario: Interests selected matches the highlighted interests
    Then the Interests selected stat should equal the number of selected interests

  # ---------- Preferences ----------

  @HappyPath
  Scenario: Current city is shown in the preferences
    Then the City preference should be "London"

  @HappyPath
  Scenario: Changing the city updates the profile
    When I change the City preference to "Glasgow"
    Then the City preference should be "Glasgow"
    And the profile details should include "Glasgow"

  # ---------- My Interests ----------

  @HappyPath
  Scenario: Selected interests are highlighted
    Then the following interests should be selected:
      | Football      |
      | Gym & Fitness |
      | Food & Dining |
      | Pub & Social  |
      | Cinema        |
      | Swimming      |
      | Dancing       |

  @HappyPath
  Scenario Outline: Adding an interest
    Given the interest "<interest>" is not selected
    When I tap the interest "<interest>"
    Then the interest "<interest>" should be selected
    And the Interests selected stat should increase by 1

    Examples:
      | interest    |
      | Rugby       |
      | Running     |
      | Board Games |

  @HappyPath
  Scenario Outline: Removing an interest
    Given the interest "<interest>" should be selected
    When I tap the interest "<interest>"
    Then the interest "<interest>" should not be selected
    And the "Interests selected" stat should decrease by 1

    Examples:
      | interest |
      | Football |
      | Cinema   |

  @HappyPath
  Scenario: Interest changes are saved
    When I tap the interest "Rugby"
    And I refresh the page
    Then the interest "Rugby" should be selected

  # ---------- Navigation ----------

  @HappyPath @smoke
  Scenario: Profile is highlighted in the sidebar
    Then "Profile" should be the active sidebar item

  @HappyPath
  Scenario Outline: Sidebar links open the correct page
    When I click "<link>" in the sidebar
    Then I should be on the "<page>" page

    @smoke
    Examples: Core navigation
      | link   | page   |
      | Roosts | Roosts |

    Examples: Other pages
      | link      | page      |
      | Flocks    | Discover  |
      | My Flocks | My Flocks |
      | My Roosts | My Roosts |
      | About     | About     |

  @SadPath
  Scenario: Sidebar chat link displays TBI message
    When I click "Chats" in the sidebar
    Then I should see a popup message
    And I should be on the "Profile" page

  # ---------- Sign out ----------

  @HappyPath @smoke
  Scenario: Signing out from the profile page
    When I click Sign Out in the sidebar footer
    Then I should be signed out
    And I should be on the login page

  # ---------- Edit profile ----------

  @HappyPath @smoke
  Scenario: Open Edit Form
    When I click ✎ Edit profile
    Then the edit profile form should be displayed

  Scenario Outline: Edit Profile Updates
    When I click ✎ Edit profile
    Then the edit profile form should be displayed
    And I enter "<firstname>" and "<lastname>"
    And I click to confirm
    Then my account page should show "<firstname>" and "<lastname>"

    @HappyPath
    Examples: Valid names
      | firstname | lastname |
      | Nish      | Mandal   |
      | Paul      | Hall     |
      | Wen       | zhu      |

    @SadPath
    Examples: Missing last name
      | firstname | lastname |
      | zuhaib    |          |

  @HappyPath
  Scenario Outline: Updating date of birth
    When I click ✎ Edit profile
    And I set my date of birth to "<DOB>"
    And I click to confirm
    Then I should see the profile details "<result>"

    Examples:
      | DOB        | result       |
      | 2001-10-02 | 25 years old |
      | 2008-01-05 | 18 years old |
      | 2000-02-29 | 26 years old |
