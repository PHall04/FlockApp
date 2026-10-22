package com.sparta.FlockApp.pages;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.By;
import org.openqa.selenium.support.FindBy;

import java.util.List;

@DefaultUrl("https://nishman89.github.io/flock/home.html")
public class HomePage extends PageObject {

    // Locators for the category pills based on their text
    @FindBy(xpath = "//button[contains(., 'Sports')] | //span[contains(., 'Sports')] | //*[contains(text(), 'Sports')]")
    private WebElementFacade sportsFilterButton;

    @FindBy(xpath = "//button[contains(., 'All')] | //span[contains(., 'All')] | //*[contains(text(), 'All')]")
    private WebElementFacade allFilterButton;

    // Locators for all visible event cards
    @FindBy(css = ".card, .roost-card, [class*='card']")
    private List<WebElementFacade> eventCards;

    public void clickSportsFilter() {
        sportsFilterButton.waitUntilClickable().click();
    }

    public void clickAllFilter() {
        allFilterButton.waitUntilClickable().click();
    }

    public boolean areAllVisibleCardsTaggedWith(String expectedCategory) {
        waitABit(500); // brief pause for UI cards to filter
        List<WebElementFacade> visibleBadges = findAll(By.xpath("//*[contains(text(), '" + expectedCategory.toUpperCase() + "')]"));
        return !visibleBadges.isEmpty();
    }

    public int getVisibleCardCount() {
        return eventCards.size();
    }
}