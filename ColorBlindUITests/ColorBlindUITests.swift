//
//  ColorBlindUITests.swift
//  ColorBlindUITests
//
//  Created by Matteo Crippa on 31/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import XCTest


let app = XCUIApplication()
class ColorBlindUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        setupSnapshot(app)
        app.launch()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testExample() {
        snapshot("0Lanch")
        app.buttons["Take the survey"].tap()
        snapshot("1First")
        app.scrollViews.otherElements.buttons["Get Started"].tap()
        app.tables.staticTexts["A duck"].tap()
        snapshot("2Second")
    }
}
