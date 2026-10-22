package com.sparta.FlockApp.steps;

import com.sparta.FlockApp.pages.ProfilePage;
import io.cucumber.java.PendingException;
import io.cucumber.java.en.Then;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;

public class ProfileStepDefs {
    private ProfilePage profilePage;
    @Then("I should see the profile name {string}")
    public void iShouldSeeTheProfileName(String arg0) {

    }
}
