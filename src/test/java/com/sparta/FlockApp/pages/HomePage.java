package com.sparta.FlockApp.pages;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.serenitybdd.core.annotations.findby.FindBy;
import net.thucydides.core.pages.PageObject;

@DefaultUrl("https://nishman89.github.io/flock/home.html")
public class HomePage extends PageObject {

    @FindBy(id = "sidebar-signout-btn")
    private WebElementFacade signOutButton;


    public void clickSignOutButton(){
        signOutButton.click();
    }

}
