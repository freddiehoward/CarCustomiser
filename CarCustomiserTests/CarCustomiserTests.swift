//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Freddie H on 10/01/2024.
//

import XCTest

final class CarCustomiserTests: XCTestCase {
    
    func testNewCarGivesMeACarWithAllAttributesSet() {
        
        //arrange
        //act
        
        let car = Car(make: "Ferrari", model: "La Ferrari", topSpeed: 205, acceleration: 5.3, handling: 8)
        
        //assert
        
        XCTAssertEqual(car.make, "Ferrari")
        XCTAssertEqual(car.model, "La Ferrari")
        XCTAssertEqual(car.topSpeed, 205)
        XCTAssertEqual(car.acceleration, 5.3)
        XCTAssertEqual(car.handling, 8)
    }
    
}
