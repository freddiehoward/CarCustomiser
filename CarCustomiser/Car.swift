//
//  Car.swift
//  CarCustomiser
//
//  Created by Freddie H on 11/01/2024.
//

import Foundation

struct Car {
    
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    init(make: String, model: String, topSpeed: Int, acceleration: Double, handling: Int) {
        
        self.make = make
        self.model = model
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        self.handling = handling
        
    }
    
    func displayStats() -> String {
        
        return """
Make: \(self.make)
Model: \(self.model)
Top Speed: \(self.topSpeed)mph
Acceleration (0-60): \(self.acceleration)s
Handling: \(self.handling)
"""
        
    }
    
}
