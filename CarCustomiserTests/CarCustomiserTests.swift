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
        let expected = """
Make: \(car.make)
Model: \(car.model)
Top Speed: \(car.topSpeed)mph
Acceleration (0-60): \(car.acceleration)s
Handling: \(car.handling)
"""
        
        //assert
        
        XCTAssertEqual(expected, car.displayStats())
    }
    
}
