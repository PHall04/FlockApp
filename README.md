# FlockApp Automated Testing Framework

An automated UI test framework built for the Flock web application, developed by an 8-member Scrum team during a one-sprint testing project at Sparta Global Academy.

---

## 1. Project Goal

The primary goal of this project is to build an automated, maintainable end-to-end regression test suite for the Flock web application (https://nishman89.github.io/flock/login.html).

Key objectives:
* Derive business requirements and User Stories from manual exploratory testing of the target website.
* Implement the Page Object Model (POM) to separate page structure and element locators from test logic.
* Implement Behavior-Driven Development (BDD) using Cucumber Gherkin scenarios to provide clear traceability between user journeys and technical implementations.
* Collaborate using Scrum practices, Git feature branches, pull request peer reviews, and automated CI test execution.

---

## 2. Technology Stack

* Language: Java (JDK 21)
* Automation Framework: Selenium WebDriver, Serenity BDD
* BDD Engine: Cucumber JVM with JUnit 5 Platform Suite
* Assertions: Hamcrest Matchers
* Build Tool: Apache Maven
* Version Control: Git, GitHub, GitHub Desktop
* Target Application: https://nishman89.github.io/flock/

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


