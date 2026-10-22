# FlockApp Automated Testing Framework

An automated UI test framework built for the Flock web application, developed by an 8-member Scrum team during a one-sprint testing project at Sparta Global Academy.

## 1. Project Goal

The primary goal of this project is to build an automated, maintainable end-to-end regression test suite for the Flock web application (https://nishman89.github.io/flock/login.html).

Key objectives:

- Derive business requirements and User Stories from manual exploratory testing of the target website.
- Implement the Page Object Model (POM) to separate page structure and element locators from test logic.
- Implement Behaviour-Driven Development (BDD) using Cucumber Gherkin scenarios to provide clear traceability between user journeys and technical implementations.
- Collaborate using Scrum practices, Git feature branches, pull request peer reviews, and automated CI test execution.

## 2. Technology Stack

| Area | Tool | Version |
|---|---|---|
| Language | Java | JDK 21 |
| Automation framework | Serenity BDD (with Selenium WebDriver) | 3.9.8 (Selenium 4.10.0) |
| BDD engine | Cucumber JVM on the JUnit 5 Platform | 7.13.0 |
| Test platform | JUnit 5 (aligned via the JUnit BOM) | 5.9.3 |
| Driver management | WebDriverManager | 5.8.0 |
| Assertions | Hamcrest Matchers | 2.2 |
| Build tool | Apache Maven | 3.8 or higher |
| CI | GitHub Actions | - |
| Version control | Git, GitHub, GitHub Desktop | - |
| Target application | https://nishman89.github.io/flock/ | - |

### Dependency notes

Some versions are pinned deliberately. Changing them has broken the build before, so check these notes before upgrading anything.

- **JUnit BOM 5.9.3**: Serenity 3.9.8 is built against JUnit 5.9. Mixing in JUnit 5.10 causes a `NoClassDefFoundError` (`NamespacedHierarchicalStore$CloseAction`) and no tests run.
- **JUnit 4.13.2 (test scope)**: Serenity's Cucumber reporter needs a JUnit 4 class to record Scenario Outline example rows. Without it, outline rows error with `NoClassDefFoundError: org/junit/runners/ParentRunner` and are missing from the report. JUnit 4 tests are not run; the classes are only loaded.
- **WebDriverManager 5.8.0**: Serenity bundles an older version (5.3.2) that cannot resolve drivers for Chrome 115 and above, and falls back to ChromeDriver 114. Declaring 5.8.0 explicitly overrides it.
- **cucumber-junit-platform-engine**: required for the runner's `@IncludeEngines("cucumber")`. If it is missing, Maven reports `TestEngine with ID 'junit-platform-suite' failed to discover tests`.

## 3. Directory Structure

```
FlockApp/
├── pom.xml
└── src/test/
    ├── java/com/sparta/FlockApp/
    │   ├── pages/                        Page objects (locators and page actions)
    │   │   ├── AboutPage.java
    │   │   ├── HomePage.java
    │   │   ├── LoginPage.java
    │   │   ├── OnboardingPage.java
    │   │   ├── ProfilePage.java
    │   │   └── SignupPage.java
    │   ├── runners/
    │   │   └── ExampleTestRunner.java
    │   └── steps/                        Step definitions and hooks
    │       ├── AboutStepDefs.java
    │       ├── Hooks.java
    │       ├── LocationStepDefs.java
    │       ├── LoginStepDefs.java
    │       ├── LogoutStepdefs.java
    │       ├── OnboardingStepdefs.java
    │       ├── ProfileStepDefs.java
    │       ├── SearchRoostsStepDefs.java
    │       ├── SignUpStepdefs.java
    │       └── SportsFeedSteps.java
    └── resources/
        ├── features/
        │   ├── About/
        │   │   └── About.feature
        │   ├── Location/
        │   │   └── Location.feature
        │   ├── Login/
        │   │   └── login.feature
        │   ├── Logout/
        │   │   └── Logout.feature
        │   ├── Onboarding/
        │   │   └── Onboarding.feature
        │   ├── Profile/
        │   │   └── profile.feature
        │   ├── Searchbars/
        │   │   └── searchroosts.feature
        │   ├── SignUp/
        │   │   └── SignUp.feature
        │   └── SportsFeed/
        │       └── sportsFeed.feature
        ├── cucumber.properties
        ├── junit-platform.properties
        └── serenity.properties
```

The folder structure under `features/` becomes the requirements tree in the Serenity report, so keep one folder per area of the application.

## 4. Configuration Files

| File | Used by | Purpose |
|---|---|---|
| `junit-platform.properties` | Maven and the runner class | Sets the step definition package (`cucumber.glue=com.sparta.FlockApp.steps`) and the Serenity reporter plugin |
| `cucumber.properties` | Running a `.feature` file directly from IntelliJ | Same settings as above, for IntelliJ's Cucumber launcher, which does not read `junit-platform.properties` |
| `serenity.properties` | Serenity | Browser (Chrome, headless), timeouts, screenshot policy, browser restart per scenario, report title |

Key `serenity.properties` settings:

- `webdriver.autodownload=true`: downloads the ChromeDriver matching the installed Chrome. No driver file is stored in the repository.
- `serenity.restart.browser.for.each=scenario`: starts a fresh browser for each scenario.
- `serenity.take.screenshots=AFTER_EACH_STEP`: a screenshot is taken after every Gherkin step and shown in the report.
- To watch tests run in a visible browser, remove `--headless` from `chrome.switches`.

## 5. Framework Setup and Test Execution

### Prerequisites

Before running the framework, ensure you have the following installed on your machine:

- Java Development Kit (JDK 21)
- Apache Maven (3.8 or higher)
- Google Chrome browser (any current version; the matching driver is downloaded automatically)

### Installation

Clone the repository to your local machine:

```
git clone https://github.com/Team1TheBest/FlockApp.git
cd FlockApp
```

Switch to the team integration branch:

```
git checkout dev
```

Download and verify Maven dependencies:

```
mvn clean install -DskipTests
```

### Running Tests

Run all tests via command line (Maven):

```
mvn clean verify
```

Run only the scenarios with a given tag:

```
mvn clean verify -Dcucumber.filter.tags="@profile"
```

Tags can be combined, for example `"@login and not @wip"`.

Run via IntelliJ IDEA:

1. Open the project in IntelliJ IDEA.
2. In the project explorer, navigate to `src/test/java/com/sparta/FlockApp/runners/ExampleTestRunner.java`.
3. Right-click `ExampleTestRunner` and select Run 'ExampleTestRunner' (or click the green play icon next to the class name).

Run an individual feature file: right-click any `.feature` file (for example `src/test/resources/features/sportsFeed/sportsFeed.feature`) and select Run 'Feature: ...'.

Note: running from IntelliJ executes the tests but does not rebuild the HTML report. Run `mvn serenity:aggregate` afterwards, or use `mvn clean verify` for a full run with a report.

### Viewing Test Reports

Serenity compiles an interactive HTML report after each Maven run.

To view the report:

1. Locate the file generated at `target/site/serenity/index.html`.
2. Right-click `index.html` in IntelliJ and select Open In > Browser (or double-click the file in File Explorer).

The report displays overall pass/fail status, results by feature and tag, execution duration, individual step results, and a screenshot for each step.

The report is generated even when tests fail. The build is marked as failed afterwards by the `serenity:check` goal, so a red build still produces a full report.

To share the report, zip the whole `target/site/serenity` folder. `index.html` on its own will not display correctly, as it links to the other files in that folder.

## 6. Continuous Integration

Tests run automatically on GitHub Actions using the workflow in `.github/workflows/flockapp-web-tests.yml`.

- **Triggers**: every push to `main`, every pull request into `main`, and manually via the Run workflow button in the Actions tab.
- **Environment**: Ubuntu runner, JDK 21 (Temurin), headless Chrome.
- **Command**: `mvn -B clean verify`
- **Report**: the Serenity report is uploaded as a build artifact named `serenity-report` on every run, including failed runs. Download it from the run's Summary page, unzip it and open `index.html`.

## 7. What Was Tested

The test suite validates core user journeys across the application, covering both happy and sad paths.

### User Authentication (login.feature)

- Positive path: successful login using valid credentials (standard_user) leading to the home feed (home.html).
- Negative path: submitting invalid credentials produces the expected error notification.
- Negative path: submitting empty username or password fields.

### Feed Filtering and Category Management (sportsFeed.feature)

- Positive path (Category Isolation): selecting the Sports category chip (`data-cat="Sports"`), verifying that visible cards update and display the SPORTS category badge.
- Positive path (Category Reset): selecting the All category chip, confirming that cards across multiple categories are restored.
- Negative path (Zero Results): submitting an unmatched search string within a filtered feed to confirm non-matching cards are removed cleanly.

### User Profile (profile.feature)

- Profile header shows the user's name, age and city.
- My Stats shows Flocks joined and Interests selected, and the interests count matches the number of highlighted interest chips.
- City preference shows the saved city and updates when a new city is selected from the dropdown.
- Selected interests are highlighted; interests can be added and removed (Scenario Outlines), and changes persist after a page refresh.
- Account section shows the username.
- Profile is highlighted as the active sidebar item.

### Navigation and Session Management

- Positive path: sidebar links open the correct page.
- Positive path: accessing the desktop navigation sidebar to execute user sign-out (`#sidebar-signout-btn`), validating session termination and redirection to login.html.

## 8. Test Data and State

- The Flock application saves profile changes (interests and city) immediately. Scenarios that change these values change the test account's saved data, which can affect later runs. `Given` steps set the starting state (for example, deselecting an interest before a test adds it) rather than assuming it.
- `Hooks.java` clears cookies, localStorage and sessionStorage after every scenario. This is required because Serenity treats a Scenario Outline as one test and does not restart the browser between its example rows; without the hook, later rows start already logged in.

## 9. Test Metrics

| Metric | Details |
|---|---|
| Test levels | UI End-to-End, Integration |
| Automation tooling | Serenity BDD, Cucumber, Selenium |
| Total scenarios automated | 49 scenarios (64 test cases including Scenario Outline example rows) |
| Pass rate | 95.3% (61 passed, 1 failed, 2 errors) |
| Execution environment | Google Chrome (headless locally and on GitHub Actions) |
| Total execution time | 3 min 45 s (approx. 3.5 s per test case; fastest 308 ms, slowest 20.9 s) |

Metrics are from the full run on 22 October 2026.

### Key Defects Logged

| ID | Summary | Severity | Status |
|---|---|---|---|
| | | | |

## 10. Team Collaboration and Branching Strategy

Team size: 8 engineers

Git workflow:

- `main`: stable release branch.
- `dev`: integration branch for sprint deliverables.
- `feature/*`: independent branches for each user story, merged via reviewed pull requests.

Team conventions:

- **Shared steps live in one place.** A step such as logging in must be defined in a single step class (`LoginStepDefs`) and reused by other features. Two methods matching the same step text cause a `DuplicateStepDefinitionException` and no scenarios run.
- **Check `pom.xml` changes in pull requests.** Removed or changed dependencies have broken test discovery for the whole suite.
- **Run the full suite after pulling** (`mvn clean verify`) before pushing new work.

## 11. Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `TestEngine with ID 'junit-platform-suite' failed to discover tests` | Cucumber engine missing, or a Gherkin syntax or merge-conflict error in a feature file | Check `target/surefire-reports/*.dump` for the real cause; restore `cucumber-junit-platform-engine` in `pom.xml` |
| `DuplicateStepDefinitionException` | Two step methods match the same Gherkin text | Keep one definition and delete the other |
| `This version of ChromeDriver only supports Chrome version 114` | Outdated WebDriverManager in use | Declare `webdrivermanager` 5.8.0 in `pom.xml`; delete `resolution.properties` from `%USERPROFILE%\.cache\selenium` |
| Scenario Outline rows missing from the report | JUnit 4 classes not on the classpath | Add `junit` 4.13.2 (test scope) |
| Serenity report is empty or out of date | Report not regenerated, or config files missing from `src/test/resources` | Run `mvn clean verify`; check the three properties files are present |
| Later example rows fail to find the login form | Session carried over between outline rows | Make sure `Hooks.java` is in the steps package |
| `StaleElementReferenceException` | Page re-rendered after an action, invalidating elements found earlier | Stop looping after a click; re-find elements through the page object |