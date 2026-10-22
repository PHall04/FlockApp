# FlockApp Automated Testing Framework

An automated UI test framework built for the Flock web application, developed by an 8-member Scrum team during a one-sprint testing project at Sparta Global Academy.

---

## 1. Project Goal

The primary goal of this project is to build an automated, maintainable end-to-end regression test suite for the Flock web application (https://nishman89.github.io/flock/login.html).

Key objectives:
- Derive business requirements and User Stories from manual exploratory testing of the target website.
- Implement the Page Object Model (POM) to separate page structure and element locators from test logic.
- Implement Behavior-Driven Development (BDD) using Cucumber Gherkin scenarios to provide clear traceability between user journeys and technical implementations.
- Collaborate using Scrum practices, Git feature branches, pull request peer reviews, and automated CI test execution.

---

## 2. Technology Stack

- **Language:** Java (JDK 21)
- **Automation Framework:** Selenium WebDriver, Serenity BDD
- **BDD Engine:** Cucumber JVM with JUnit 5 Platform Suite
- **Assertions:** Hamcrest Matchers
- **Build Tool:** Apache Maven
- **Version Control:** Git, GitHub, GitHub Desktop
- **Target Application:** https://nishman89.github.io/flock/

### Directory Structure:
```text
src/test/
├── java/com/sparta/FlockApp/
│   ├── pages/
│   │   ├── LoginPage.java
│   │   └── HomePage.java
│   ├── runners/
│   │   └── ExampleTestRunner.java
│   └── steps/
│       ├── LoginStepDefs.java
│       └── SportsFeedSteps.java
└── resources/
    ├── features/
    │   ├── login/
    │   │   └── login.feature
    │   └── sportsFeed/
    │       └── sportsFeed.feature
    ├── cucumber.properties
    ├── junit-platform.properties
    └── serenity.properties
```

---

## 3. Framework Setup and Test Execution

### Prerequisites
Before running the framework, ensure you have the following installed on your machine:
- Java Development Kit (JDK 21)
- Apache Maven (3.8 or higher)
- Google Chrome browser

### Installation
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Team1TheBest/FlockApp.git
   cd FlockApp
   ```

2. Switch to the team integration branch:
   ```bash
   git checkout dev
   ```

3. Download and verify Maven dependencies:
   ```bash
   mvn clean install -DskipTests
   ```

### Running Tests
- **Run all tests via command line (Maven):**
  ```bash
  mvn clean verify
  ```

- **Run via IntelliJ IDEA:**
    1. Open the project in IntelliJ IDEA.
    2. In the project explorer, navigate to `src/test/java/com/sparta/FlockApp/runners/ExampleTestRunner.java`.
    3. Right-click `ExampleTestRunner` and select **Run 'ExampleTestRunner'** (or click the green play icon next to the class name).

- **Run an individual feature file:**
  Right-click any `.feature` file (e.g., `src/test/resources/features/sportsFeed/sportsFeed.feature`) and select **Run 'Feature: ...'**.

### Viewing Test Reports
Serenity automatically compiles an interactive HTML report after test execution.

To view the report:
1. Locate the file generated at:
   ```text
   target/site/serenity/index.html
   ```
2. Right-click `index.html` in IntelliJ and select **Open in Browser** (or double-click the file in File Explorer to open it in Chrome).
3. The report displays overall pass/fail status, execution duration, individual step results, and automatic failure screenshots.

---

## 4. What Was Tested

The test suite validates core user journeys across the application, covering both happy and sad paths:

### User Authentication (`login.feature`)
- **Positive path:** Successful login using valid credentials (`standard_user`) leading to the home feed (`home.html`).
- **Negative path:** Submitting invalid credentials producing the expected error notification.
- **Negative path:** Submitting empty username or password fields.

### Feed Filtering and Category Management (`sportsFeed.feature`)
- **Positive path (Category Isolation):** Selecting the Sports category chip (`data-cat="Sports"`), verifying that visible cards update and display the SPORTS category badge.
- **Positive path (Category Reset):** Selecting the All category chip, confirming that cards across multiple categories are restored.
- **Negative path (Zero Results):** Submitting an unmatched search string within a filtered feed to confirm non-matching cards are removed cleanly.

### Navigation and Session Management
- **Positive path:** Accessing the desktop navigation sidebar to execute user sign-out (`#sidebar-signout-btn`), validating session termination and redirection to `login.html`.

---

## 5. Test Metrics

| Metric | Details                            |
| :--- |:-----------------------------------|
| **Test Levels** | UI End-to-End, Integration         |
| **Automation Tooling** | Serenity BDD, Cucumber, Selenium   |
| **Total Scenarios Automated** |                                    |
| **Pass Rate** |                                    |
| **Execution Environment** | Google Chrome (Headless / Desktop) |
| **Average Execution Time** |             |

### Key Defects Logged


---

## 6. Team Collaboration and Branching Strategy


- **Team Size:** 8 Engineers
- **Git Workflow:**
    - `main`: Stable release branch.
    - `dev`: Integration branch for sprint deliverables.
    - `feature/*`: Independent branches for each user story, merged via reviewed pull requests.