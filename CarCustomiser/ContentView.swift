//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Freddie H on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    let car = Car(make: "Ferrari", model: "La Ferrari", topSpeed: 205, acceleration: 5.3, handling: 8)
    
    var body: some View {

        Text("""
Make: \(car.make)
Model: \(car.model)
Top Speed: \(car.topSpeed)mph
Acceleration (0-60): \(car.acceleration)s
Handling: \(car.handling)
*test to see if this pushes correctly*
""")
                .padding()
    }
}

#Preview {
    ContentView()
}
