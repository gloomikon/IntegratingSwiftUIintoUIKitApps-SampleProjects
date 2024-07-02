//
//  ParksView.swift
//  BestParksSwiftUI-starter
//
//  Created by Natalia Panferova on 3/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ParksView: View {
    @EnvironmentObject var parksController: ParksController
    @Binding var selectedParkID: UUID?
    
    var body: some View {
        List(
            parksController.parks,
            selection: $selectedParkID
        ) { park in
            Group {
                if #available(iOS 16.0, *) {
                    ParkListRow(park: park)
                } else {
                    LegacyParkListRow(
                        park: park,
                        selectedParkID: $selectedParkID
                    )
                }
            }
            .swipeActions {
                Button(role: .destructive) {
                    parksController.deletePark(id: park.id)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Parks")
        .toolbar {
            Button {
                parksController.addPark()
            } label: {
                Label("Add", systemImage: "plus")
            }
            .disabled(!parksController.canAddParks)
        }
    }
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
        ParksView(selectedParkID: .constant(nil))
            .environmentObject(ParksController.mockController)
    }
}
