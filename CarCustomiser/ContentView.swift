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
    
    @State private var remainingTime = 30
    
    
    var exhaustPackageAffordable: Bool {
        
        return exhaustPackage ? true : remainingFunds >= 500 ? true : false
        
   }
    
    var tiresPackageAffordable: Bool {
        
        return tiresPackage ? true : remainingFunds >= 300 ? true : false

    }
    
    var nitrousPackageAffordable: Bool {
        
        return nitrousPackage ? true : remainingFunds >= 750 ? true : false
        
    }
    
    var winterChainsPackageAffordable: Bool {
        
        return winterChainsPackage ? true : remainingFunds >= 200 ? true : false
        
    }
    
    var timeUp: Bool {
        
        return remainingTime>0 ? true : false
        
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        
        
        //get: uses self.exhaust package in toggle, set: sets newValue to be used in setting new values
        
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
                remainingFunds += 200
            }
        })
        
        
        
        VStack {
            
            Text("\(remainingTime)")
                .onReceive(timer, perform: { _ in
                    if remainingTime > 0 {
                        remainingTime -= 1
                    }
                })
                .foregroundColor(.red)
            
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
                    .disabled(!timeUp)
                    
                    Section {
                        
                        Toggle("Exhaust Package (cost: 500)", isOn: exhaustPackageBinding)
                            .disabled(!timeUp)
                            .disabled(!exhaustPackageAffordable)
                        Toggle("Tires Package (cost: 300)", isOn: tiresPackageBinding)
                            .disabled(!timeUp)
                            .disabled(!tiresPackageAffordable)
                        Toggle("Nitrous Package (cost: 750)", isOn: nitrousPackageBinding)
                            .disabled(!timeUp)
                            .disabled(!nitrousPackageAffordable)
                        Toggle("Winter Chains Package (cost: 200)", isOn: winterChainsPackageBinding)
                            .disabled(!timeUp)
                            .disabled(!winterChainsPackageAffordable)
                        
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


