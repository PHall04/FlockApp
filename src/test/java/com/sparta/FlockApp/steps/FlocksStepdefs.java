
package com.sparta.FlockApp.steps;

import com.sparta.FlockApp.pages.FlocksPage;
import com.sparta.FlockApp.pages.LoginPage;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class FlocksStepdefs {

    FlocksPage flocksPage;
    LoginPage loginPage;

    private String selectedCity;

    @Given("I am on the FlockApp Flocks page")
    public void iAmOnTheFlockAppFlocksPage() {
        flocksPage.open();

        assertThat(
                "Should be on the Flocks page",
                flocksPage.getDriver().getCurrentUrl(),
                containsString("/flocks.html")
        );
    }

    @Then("I should see the following Flock categories:")
    public void iShouldSeeTheFollowingFlockCategories(
            List<String> categories) {

        for (String category : categories) {
            assertThat(
                    "Category should be displayed: " + category,
                    flocksPage.isCategoryDisplayed(category),
                    is(true)
            );
        }
    }

    @When("I select the {string} Flock category")
    public void iSelectTheFlockCategory(String category) {
        flocksPage.selectCategory(category);
    }

    @Then("the {string} Flock category should be active")
    public void theFlockCategoryShouldBeActive(String category) {
        assertThat(
                "Selected category should be active",
                flocksPage.isCategoryActive(category),
                is(true)
        );
    }

    @When("I search for {string} on the Flocks page")
    public void iSearchForOnTheFlocksPage(String searchText) {
        flocksPage.searchForFlock(searchText);
    }

    @Then("the Flock search field should contain {string}")
    public void theFlockSearchFieldShouldContain(String searchText) {
        assertThat(
                flocksPage.getSearchText(),
                is(searchText)
        );
    }

    @When("I clear the Flock search")
    public void iClearTheFlockSearch() {
        flocksPage.clearSearch();
    }

    @Then("the Flock search field should be empty")
    public void theFlockSearchFieldShouldBeEmpty() {
        assertThat(
                flocksPage.isSearchEmpty(),
                is(true)
        );
    }

    @When("I sort Flocks by {string}")
    public void iSortFlocksBy(String option) {
        flocksPage.selectSortOption(option);
    }

    @Then("the selected Flock sort option should be {string}")
    public void theSelectedFlockSortOptionShouldBe(String option) {
        assertThat(
                flocksPage.getSelectedSortOption(),
                is(option)
        );
    }

    @When("I select an available Flock city")
    public void iSelectAnAvailableFlockCity() {
        selectedCity = flocksPage.selectAvailableCity();
    }

    @Then("the selected Flock city should be applied")
    public void theSelectedFlockCityShouldBeApplied() {
        assertThat(
                flocksPage.getSelectedCity(),
                is(selectedCity)
        );
    }

    @Then("no matching Flock cards should be displayed")
    public void noMatchingFlockCardsShouldBeDisplayed() {
        assertThat(
                flocksPage.getDisplayedFlockCardCount(),
                is(0)
        );
    }

    @Given("I can see available Flock cards")
    public void iCanSeeAvailableFlockCards() {
        assertThat(
                flocksPage.areFlockCardsDisplayed(),
                is(true)
        );
    }

    @When("I click on the first Flock card")
    public void iClickOnTheFirstFlockCard() {
        flocksPage.clickFirstFlockCard();
    }

    @Then("I should be redirected to the Flock details page")
    public void iShouldBeRedirectedToTheFlockDetailsPage() {
        assertThat(
                flocksPage.isOnFlockDetailsPage(),
                is(true)
        );
    }

}
