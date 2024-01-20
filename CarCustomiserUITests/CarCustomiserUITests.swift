//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Freddie H on 10/01/2024.
//

import XCTest

final class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenExhaustAndTiresBoughtTogetherOtherTwoTogglesAreDisabled() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()

        //act
        let tablesQuery = app.tables
        tablesQuery.toggles["Exhaust Package (cost: 500)"].tap()
        tablesQuery.toggles["Tires Package (cost: 300)"].tap()
        
        
        XCTAssertEqual(tablesQuery.switches["Nitrous Package (cost: 750)"].isEnabled, false)
        XCTAssertEqual(tablesQuery.switches["Winter Chains Package (cost: 200)"].isEnabled, false)
        
        //once i can actually use recording i'll make this test pass
        
        //assert
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
