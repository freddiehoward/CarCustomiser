//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Freddie H on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var starterCars = StarterCars()
    
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    
    @State private var tiresPackage = false
    
    @State private var nitrousPackage = false
    
    @State private var winterChainsPackage = false
    
    @State private var remainingFunds = 1000
    
    var exhaustPackageAffordable: Bool {
        if exhaustPackage == true {
            return true
        }
        else{
            if remainingFunds >= 500 {
                return true
            }
            else{
                return false
            }
        }
    }

    
    var body: some View {
        
        
        //get: updates self.exhaust package, set: sets newValue to be used in setting new values
        
        let exhaustPackageBinding = Binding<Bool> (get: {self.exhaustPackage}, set: {newValue in self.exhaustPackage = newValue
            if newValue == true {
                starterCars.cars[selectedCar].topSpeed += 5
                remainingFunds -= 500
            }
            else{
                starterCars.cars[selectedCar].topSpeed -= 5
                remainingFunds += 500
            }
        })
        
        let tiresPackageBinding = Binding<Bool> (get: {self.tiresPackage}, set: {newValue in self.tiresPackage = newValue
            if newValue == true {
                starterCars.cars[selectedCar].handling += 2
                remainingFunds -= 300
            }
            else{
                starterCars.cars[selectedCar].handling -= 2
                remainingFunds += 300
            }
        })
        
        let nitrousPackageBinding = Binding<Bool> (get: {self.nitrousPackage}, set: {newValue in self.nitrousPackage = newValue
            if newValue == true {
                starterCars.cars[selectedCar].acceleration -= 2
                remainingFunds -= 750
            }
            else{
                starterCars.cars[selectedCar].acceleration += 2
                remainingFunds += 750
            }
        })
        
        let winterChainsPackageBinding = Binding<Bool> (get: {self.winterChainsPackage}, set: {newValue in self.winterChainsPackage = newValue
            if newValue == true {
                starterCars.cars[selectedCar].handling += 2
                starterCars.cars[selectedCar].acceleration += 2
                remainingFunds -= 200
            }
            else{
                starterCars.cars[selectedCar].handling -= 2
                starterCars.cars[selectedCar].acceleration -= 2
                remainingFunds -= 200
            }
        })
        
        VStack {
            Form {
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Random Car", action: {
                        
                        resetStats()
                        
                        if selectedCar == starterCars.cars.count - 1 {
                            
                            selectedCar = 0
                            
                        }
                        
                        else{
                            selectedCar += 1
                        }
                        
                    })
                    
                    Section {
                        
                        Toggle("Exhaust Package (cost: 500)", isOn: exhaustPackageBinding)
                        Toggle("Tires Package (cost: 300)", isOn: tiresPackageBinding)
                        Toggle("Nitrous Package (cost: 750)", isOn: nitrousPackageBinding)
                        Toggle("Winter Chains Package (cost: 200)", isOn: winterChainsPackageBinding)
                        
                    }
                    
                }
            }
            
            Text("Remaining Funds: \(remainingFunds)")
                .baselineOffset(20)
        }
    }
    
    func resetStats() -> Void {
        
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        nitrousPackage = false
        winterChainsPackage = false
        starterCars = StarterCars()
        
        
    }
    
}

#Preview {
    ContentView()
}
