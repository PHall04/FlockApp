package com.sparta.FlockApp.pages;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.serenitybdd.core.annotations.findby.FindBy;
import org.openqa.selenium.By;

import java.util.List;

@DefaultUrl("https://nishman89.github.io/flock/profile.html")
public class ProfilePage extends PageObject {

    @FindBy(className = "profile-edit-btn")
    private WebElementFacade editProfileButton;

    @FindBy(xpath = "//*[@id='profile-body']/div[1]/div[2]/div[1]/span[2]\";")
    private WebElementFacade profileRows;

    @FindBy(className = "inline-select")
    private WebElementFacade preferenceMenu;

    @FindBy(className = "inline-chips-wrap")
    private WebElementFacade chipsWrap;

    @FindBy(id= "signout-btn")
    private WebElementFacade signOutButton;


    public String getFlocksJoinedTotal() {
        return profileRows.getText();
    }

    public void openPreferenceMenu() {
        preferenceMenu.click();
    }

    public void updatePreference() {
        preferenceMenu.thenFind("//*[@id='profile-body']/div[2]/div[2]/div/div/select/option[4]").click();
    }

    public void clickEditProfileButton() {
        editProfileButton.click();
    }

    public void clickSignOutButton() {
        signOutButton.click();
    }

}
