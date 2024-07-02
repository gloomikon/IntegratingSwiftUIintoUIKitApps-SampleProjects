//
//  ContentView.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedParkID: UUID?
    
    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationSplitView {
                    ParksView(
                        selectedParkID: $selectedParkID
                    )
                } detail: {
                    SplitViewDetailView(
                        selectedParkID: selectedParkID
                    )
                    .navigationBarTitleDisplayMode(.inline)
                    .id(selectedParkID)
                }
            } else {
                NavigationView {
                    ParksView(
                        selectedParkID: $selectedParkID
                    )
                    EmptySelectionView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(
                ParksController.mockController
            )
    }
}
