//
//  CoffeeCounter_finalApp.swift
//  CoffeeCounter-final
//
//  Created by Natalia Panferova on 11/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

@main
struct CoffeeCounter_finalApp: App {
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
