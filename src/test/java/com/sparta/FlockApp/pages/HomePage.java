package com.sparta.FlockApp.pages;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@DefaultUrl("https://nishman89.github.io/flock/home.html")
public class HomePage extends PageObject {

    @FindBy(xpath = "//button[contains(., 'Sports')] | //span[contains(., 'Sports')] | //*[contains(text(), 'Sports')]")
    private WebElementFacade sportsFilterButton;

    @FindBy(xpath = "//button[contains(., 'All')] | //span[contains(., 'All')] | //*[contains(text(), 'All')]")
    private WebElementFacade allFilterButton;


    @FindBy(css = ".card, .roost-card, [class*='card']")
    private List<WebElementFacade> eventCards;

    @FindBy(id = "search-input")
    private WebElementFacade roostSearchField;

    @FindBy(id = "events-container")
    private WebElementFacade roostResultsContainer;

    @FindBy(css = "#events-container .empty-state h3")
    private WebElementFacade noResultsHeading;

    @FindBy(css = "#events-container .empty-state p")
    private WebElementFacade noResultsDescription;

    public void clickSportsFilter() {
        sportsFilterButton.waitUntilClickable().click();
    }

    public void clickAllFilter() {
        allFilterButton.waitUntilClickable().click();
    }

    public boolean areAllVisibleCardsTaggedWith(String expectedCategory) {
        // 1. Give the page 1 second to finish filtering the cards
        waitABit(1000);

        // 2. Find all the cards on the screen
        List<WebElementFacade> cards = findAll(By.cssSelector(".card, .roost-card, [class*='card']"));

        // 3. Look at each card one by one
        for (WebElementFacade card : cards) {
            // Only check cards that are actually visible on screen
            if (card.isCurrentlyVisible()) {
                // If a visible card does NOT contain "SPORTS", the filter failed!
                if (!card.getText().toUpperCase().contains(expectedCategory.toUpperCase())) {
                    return false;
                }
            }
        }

        // If all visible cards had the category, it passed!
        return true;
    }


    public int getVisibleCardCount() {
        return eventCards.size();
    }

    @FindBy(css = "input[placeholder*='Search']")
    private WebElementFacade searchInput;

    public void searchFor(String query) {
        searchInput.typeAndEnter(query);
    }
    public void searchRoosts(String keyword) {
        typeInto(roostSearchField, keyword);
    }

    public List<String> getDisplayedRoosts() {
        return getDriver()
                .findElements(By.cssSelector(
                        "#events-container [id^='roost-card-']"))
                .stream()
                .filter(WebElement::isDisplayed)
                .map(WebElement::getText)
                .collect(Collectors.toList());
    }

    public boolean areDisplayedRoostsMatching(String keyword) {
        String searchTerm = keyword.toLowerCase(Locale.ROOT);
        List<String> roosts = getDisplayedRoosts();

        return !roosts.isEmpty()
                && roosts.stream().allMatch(
                roost -> roost.toLowerCase(Locale.ROOT).contains(searchTerm));
    }

    public String getSearchResultsText() {
        return roostResultsContainer.getText();
    }

    public String getNoResultsHeading() {
        return noResultsHeading.getText();
    }

    public String getNoResultsDescription() {
        return noResultsDescription.getText();
    }



}