//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Sajed Shaikh on 27/07/24.
//

import XCTest

final class when_user_clicks_on_login_button: XCTestCase {
    
    private var app: XCUIApplication!
    private var loginPageObject: LoginPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        loginPageObject = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
    }

    func test_should_display_error_message_for_missing_required_fields() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_display_error_message_for_invalid_credentials() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("WrongPassword")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }
    
    func test_should_navigate_to_dashbaord_screen_when_authenticated() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let dashboardNavigationBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavigationBarTitle.waitForExistence(timeout: 0.5))
    }
    
}
