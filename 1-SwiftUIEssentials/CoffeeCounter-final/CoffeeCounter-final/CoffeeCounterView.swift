//
//  CoffeeCounterView.swift
//  CoffeeCounter-final
//
//  Created by Natalia Panferova on 12/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct CoffeeCounterView: View {
    @EnvironmentObject private var dataModel: DataModel
    
    var body: some View {
        VStack {
            Text("Today you've had \(dataModel.coffeeCount) cups of coffee.")
            Button("Have a coffee") {
                dataModel.coffeeCount += 1
            }
        }
        .textCase(.uppercase)
        .buttonStyle(.borderedProminent)
        .toolbar {
            Button("Reset") {
                dataModel.coffeeCount = 0
            }
            .accessibilityLabel("Reset counter")
        }
    }
}

struct CoffeeCounterView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCounterView()
            .environmentObject(DataModel())
    }
}
