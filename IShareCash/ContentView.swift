//
//  ContentView.swift
//  IShareCash
//
//  Created by Ricardo Roman Landeros on 29/03/21.
//

import SwiftUI

struct ContentView: View {
    
    //Propiedad computada es decir dentro hacemos las operaciones necesarias para
    //Calcular su valor
    var totalPerPersona: Double {
        let popleCount = Double(nummberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amoutPerPerson = grandTotal / popleCount
        return amoutPerPerson
    }
    
    //Propiedad computada es decir dentro hacemos las operaciones necesarias para
    //Calcular su valor
    var totalCuenta: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var checkAmount = ""
    @State private var nummberOfPeople = 0
    @State private var tipPercentage = 2
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $nummberOfPeople) {
                        ForEach(2 ..< 100) { number in
                            Text("\(number) people")
                        }
                    }
                }
                
                Section(header: Text("Que procentaje de propina?")) {
                    Picker("Propina %", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) { porcentaje in
                            Text("\(self.tipPercentages[porcentaje])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Cantidad Por Persona")) {
                    Text("$\(totalPerPersona, specifier: "%.2f")")
                }
                
                Section(header: Text("Total a Pagar con propinaA")) {
                    Text("$\(totalCuenta, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("iShareCash", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
