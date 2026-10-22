package com.sparta.FlockApp.steps;

import com.sparta.FlockApp.pages.HomePage;
import com.sparta.FlockApp.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.junit5.SerenityJUnit5Extension;
import net.thucydides.core.annotations.Managed;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.extension.ExtendWith;

@ExtendWith(SerenityJUnit5Extension.class)
public class LogoutStepdefs {
    @Managed
    private HomePage logoutPage;
    @Managed
    private LoginPage loginPage;

    @Given("i am logged in on the flockApp")
    public void theUserIsLoggedInOnTheFlockApp() {
        loginPage.open();
        loginPage.enterUsername("nish");
        loginPage.enterPassword("mandal");
        loginPage.clickLoginButton();
    }

    @When("i click the logout button on the current page")
    public void theUserClicksTheLogoutButtonOnTheCurrentPage() {
        logoutPage.open();
        logoutPage.clickSignOutButton();
    }

    @Then("i should be returned to the login page")
    public void theUserShouldBeReturnedToTheLoginPage() {
        MatcherAssert.assertThat(logoutPage.getDriver().getCurrentUrl(), Matchers.is("https://nishman89.github.io/flock/login.html"));
    }
}