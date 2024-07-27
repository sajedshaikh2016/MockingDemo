//
//  LoginPageObject.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Sajed Shaikh on 27/07/24.
//

import Foundation
import XCTest

class LoginPageObject {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField: XCUIElement {
        app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        app.textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        app.buttons["loginButton"]
    }
    
    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
}
