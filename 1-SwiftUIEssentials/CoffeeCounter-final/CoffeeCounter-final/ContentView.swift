//
//  ContentView.swift
//  CoffeeCounter-final
//
//  Created by Natalia Panferova on 11/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let coffeeSymbolName = "cup.and.saucer.fill"
    
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass
    
    @Environment(\.dynamicTypeSize)
    private var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 40) {
                if horizontalSizeClass == .regular {
                    CoffeePhoto()
                }
                VStack {
                    if !dynamicTypeSize.isAccessibilitySize {
                        LargeSymbol(name: coffeeSymbolName)
                    }
                    Text("Let's track your daily coffee intake!")
                    Spacer()
                        .frame(height: 30)
                    CoffeeCounterView()
                }
            }
        }
        .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 mini")
            
            ContentView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
        }
        .environmentObject(DataModel())
    }
}
