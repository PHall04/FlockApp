package com.sparta.FlockApp.steps;

import com.sparta.FlockApp.pages.SignupPage;
import com.sparta.FlockApp.pages.OnboardingPage;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

import net.thucydides.core.annotations.Steps;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class OnboardingStepdefs {

    SignupPage signupPage;
    OnboardingPage onboardingPage;

    @Given("I am on the FlockApp signup page")
    public void iAmOnTheSignupPage() {
        signupPage.open();
    }

    @When("I register a new account with first name {string} and last name {string}")
    public void iRegisterANewAccount(String firstName, String lastName) {

        String username = "testuser" + System.currentTimeMillis();

        signupPage.enterAndSubmitFields(
                firstName,
                lastName,
                username,
                "Password123",
                "Password123"
        );
    }

    @Then("I should be redirected to the onboarding page")
    public void iShouldBeRedirectedToOnboarding() {
        onboardingPage.waitForCondition().until(
                driver -> driver.getCurrentUrl().contains("onboarding.html")
        );

        assertThat(
                onboardingPage.getDriver().getCurrentUrl(),
                containsString("onboarding.html")
        );
    }

    @Then("my first name should be {string}")
    public void myFirstNameShouldBe(String firstName) {
        assertThat(
                onboardingPage.getFirstName(),
                is(firstName)
        );
    }

    @Then("my last name should be {string}")
    public void myLastNameShouldBe(String lastName) {
        assertThat(
                onboardingPage.getLastName(),
                is(lastName)
        );
    }

    @When("I enter {string} as my date of birth")
    public void iEnterDateOfBirth(String dateOfBirth) {
        onboardingPage.enterDateOfBirth(dateOfBirth);
    }

    @When("I select an avatar")
    public void iSelectAnAvatar() {
        onboardingPage.selectAvatar("😎");
    }

    @When("I click the Continue button")
    public void iClickContinueButton() {
        onboardingPage.clickContinueButton();
    }

    @Then("I should be on onboarding step {int}")
    public void iShouldBeOnOnboardingStep(int step) {
        assertThat(
                onboardingPage.getCurrentStep(),
                is("STEP " + step + " OF 4")
        );
    }

    @When("I select {string} as an interest")
    public void iSelectAnInterest(String interest) {
        onboardingPage.selectInterest(interest);
    }

    @When("I click the Skip button")
    public void iClickSkipButton() {
        onboardingPage.clickSkipButton();
    }

    @When("I select {string} as my city")
    public void iSelectCity(String city) {
        onboardingPage.selectCity(city);
    }

    @When("I select {string} as my distance")
    public void iSelectDistance(String distance) {
        onboardingPage.selectDistance(distance);
    }
}
