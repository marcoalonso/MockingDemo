//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Marco Alonso Rodriguez on 08/05/23.
//

import XCTest

 class whenUserClicksOnLoginButton: XCTestCase {
     
     private var app: XCUIApplication!
     
     override func setUp() {
        app = XCUIApplication()
         continueAfterFailure = false
         app.launchEnvironment = ["ENV": "TEST"]
         app.launch()
     }

     func testShouldDisplayErrorMessageForMissingRequiredFields(){
         
         let usernameTextField = app.textFields["usernameTextField"]
         usernameTextField.tap()
         usernameTextField.typeText("")
         
         let passwordTextField = app.textFields["passwordTextField"]
         passwordTextField.tap()
         passwordTextField.typeText("")
         
         let loginButton = app.buttons["loginButton"]
         loginButton.tap()
         
         let messageText = app.staticTexts["messageText"]
         
         XCTAssertEqual(messageText.label, "Required fields are missing")
     }
    
     func testShouldNavigateToDashboardScreenWhenAuthenitcated(){
         let usernameTextField = app.textFields["usernameTextField"]
         usernameTextField.tap()
         usernameTextField.typeText("JohnDoe")
         
         let passwordTextField = app.textFields["passwordTextField"]
         passwordTextField.tap()
         passwordTextField.typeText("Password")
         
         let loginButton = app.buttons["loginButton"]
         loginButton.tap()
         
         let dashboardNavBarTitle = app.staticTexts["Dashboard"]
         XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
     }
}
