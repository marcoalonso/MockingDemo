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
         
     }
}
