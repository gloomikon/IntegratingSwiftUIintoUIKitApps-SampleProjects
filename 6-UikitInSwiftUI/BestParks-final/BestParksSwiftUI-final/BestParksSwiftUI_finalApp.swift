//
//  BestParksSwiftUI_finalApp.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

@main
struct BestParksSwiftUI_finalApp: App {
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
