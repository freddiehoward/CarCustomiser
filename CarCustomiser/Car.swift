//
//  Car.swift
//  CarCustomiser
//
//  Created by Freddie H on 11/01/2024.
//

import Foundation

struct Car {
    
    let make: String
    let model: String
    let topSpeed: Int
    let acceleration: Double
    let handling: Int
    
    init(make: String, model: String, topSpeed: Int, acceleration: Double, handling: Int) {
        
        self.make = make
        self.model = model
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        self.handling = handling
        
    }
    
}
