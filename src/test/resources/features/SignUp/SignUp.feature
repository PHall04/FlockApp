Feature: User Registration
  As a new FlockApp user
  I want to create an account
  So that I can access the FlockApp

  Background:
    Given I am on the FlockApp login page
    When I click the sign up link
    Then I should be redirected to the signup page

  @SignUp @HappyPath
  Scenario: Successfully create an account with valid details
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "johnsmith123" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should be created successfully

  @SignUp @HappyPath
  Scenario: Successfully register without a last name
    When I enter "John" as my first name
    And I enter "johnwithoutlast" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should be created successfully

  @SignUp @HappyPath
  Scenario: Successfully register with a mixed-case username
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "JohnMixedCase" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should be created successfully

  @SignUp @SadPath
  Scenario: Attempt to register with all fields empty
    When I click the Create Account button
    Then my account should not be created
    And I should see the first name error "Please enter your first name"
    And I should see the username error "Username must be at least 3 characters"
    And I should see the password error "Password must be at least 6 characters"

  @SignUp @SadPath
  Scenario: Attempt to register without a first name
    When I enter "Smith" as my last name
    And I enter "johnsmith999" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should not be created
    And I should see the first name error "Please enter your first name"

  @SignUp @SadPath
  Scenario: Attempt to register with mismatched passwords
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "johnsmith789" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password456"
    And I click the Create Account button
    Then my account should not be created
    And I should see the confirm password error "Passwords do not match"

  @SignUp @SadPath
  Scenario: Attempt to register without confirming the password
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "johnnoconfirm" as my username
    And I enter "Password123" as my password
    And I click the Create Account button
    Then my account should not be created
    And I should see the confirm password error "Passwords do not match"

  # USERNAME VALIDATION TESTING

  @SignUp @SadPath
  Scenario: Attempt to register with spaces in the username
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "john smith" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should not be created
    And I should see the username error "No spaces allowed in username"

  @SignUp @SadPath
  Scenario: Attempt to register with an existing username
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "Nish" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should not be created
    And I should see the username error "That username is already taken - try another"

  @SignUp @SadPath
  Scenario: Attempt to register with an existing username in uppercase
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "NISH" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should not be created
    And I should see the username error "That username is already taken - try another"

  # BOUNDARY VALUE TESTING

  # First Name Boundary: Minimum 2 characters

  @SignUp @SadPath
  Scenario: Attempt to register with a one-character first name
    When I enter "J" as my first name
    And I enter "Smith" as my last name
    And I enter "johnshortfirst" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should not be created
    And I should see the first name error "Please enter your first name"


  @SignUp @HappyPath
  Scenario: Successfully register with a two-character first name
    When I enter "Jo" as my first name
    And I enter "Smith" as my last name
    And I enter "jotwocharacters" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should be created successfully

  # Username Boundary: Minimum 3 characters

  @SignUp @SadPath
  Scenario: Attempt to register with a username that is too short
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "ab" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should not be created
    And I should see the username error "Username must be at least 3 characters"

  @SignUp @HappyPath
  Scenario: Successfully register with a three-character username
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "abc" as my username
    And I enter "Password123" as my password
    And I confirm my password with "Password123"
    And I click the Create Account button
    Then my account should be created successfully

  # Password Boundary: Minimum 6 characters

  @SignUp @SadPath
  Scenario: Attempt to register with a password that is too short
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "johnsmith456" as my username
    And I enter "12345" as my password
    And I confirm my password with "12345"
    And I click the Create Account button
    Then my account should not be created
    And I should see the password error "Password must be at least 6 characters"

  @SignUp @HappyPath
  Scenario: Successfully register with a six-character password
    When I enter "John" as my first name
    And I enter "Smith" as my last name
    And I enter "johnsixpassword" as my username
    And I enter "123456" as my password
    And I confirm my password with "123456"
    And I click the Create Account button
    Then my account should be created successfully
