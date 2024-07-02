//
//  BestParksSwiftUI_starterApp.swift
//  BestParksSwiftUI-starter
//
//  Created by Natalia Panferova on 3/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

@main
struct BestParksSwiftUI_starterApp: App {
    @StateObject var parksController = ParksController()
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(parksController)
                .task {
                    guard !parksController.isLoaded else {
                        return
                    }
                    await parksController.loadParks()
                }
        }
        .onChange(of: scenePhase) { value in
            Task {
                switch value {
                case .background:
                    await parksController.saveParks()
                default:
                    break
                }
            }
        }
    }
}
