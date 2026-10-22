package com.sparta.FlockApp.pages;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.serenitybdd.core.annotations.findby.FindBy;
import net.thucydides.core.pages.PageObject;

@DefaultUrl("https://nishman89.github.io/flock/login.html")
public class LoginPage extends PageObject {
    @FindBy(name = "username")
    private WebElementFacade userNameField;

    @FindBy(name = "password")
    private WebElementFacade passwordField;

    @FindBy(id = "login-submit-btn")
    private WebElementFacade loginSubmitButton;

    @FindBy(id = "login-error")
    private WebElementFacade loginError;

    public void enterUsername(String username){
        userNameField.type(username);
    }

    public void enterPassword(String password){
        passwordField.type(password);
    }

    public void clickLoginButton(){
        loginSubmitButton.click();
    }

    public void enterAndSubmitFields(String username, String password){
        enterUsername(username);
        enterPassword(password);
        clickLoginButton();
    }

    public String getErrorMessage(){
        return loginError.getText();
    }
}
