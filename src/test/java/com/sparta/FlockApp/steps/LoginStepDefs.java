package com.sparta.FlockApp.steps;

import com.sparta.FlockApp.pages.LoginPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.junit5.SerenityJUnit5Extension;
import net.thucydides.core.annotations.Managed;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.extension.ExtendWith;

@ExtendWith(SerenityJUnit5Extension.class)
public class LoginStepDefs {

    @Managed
    private LoginPage loginPage;

    @Given("I am on the FlockApp login page")
    public void iAmOnTheFlockAppLoginPage() {
        loginPage.open();
    }

    @When("I enter a valid email address")
    public void iEnterAValidEmailAddress() {
        loginPage.enterUsername("nish");
    }

    @And("I ender a valid password")
    public void iEnderAValidPassword() {
        loginPage.enterPassword("mandal");
    }

    @And("I click the login button")
    public void iClickTheLoginButton() {
        loginPage.clickLoginButton();
    }

    @Then("I should be redirected to the home page")
    public void iShouldBeRedirectedToTheHomePage() {
        MatcherAssert.assertThat(loginPage.getDriver().getCurrentUrl(), Matchers.is("https://nishman89.github.io/flock/home.html"));
    }
}
