//
//  ParksView.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ParksView: View {
    @EnvironmentObject
    private var parksController: ParksController
    
    @Binding var selectedParkID: UUID?
    
    @State private var parkToColor: Park?
    
    var body: some View {
        List(
            parksController.parks,
            selection: $selectedParkID
        ) { park in
            Group {
                if #available(iOS 16.0, *) {
                    ParkListRow(
                        park: park,
                        selectedParkID: selectedParkID
                    )
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
                
                Button {
                    parkToColor = park
                } label: {
                    Label(
                        "Change theme color",
                        systemImage: "paintbrush.pointed"
                    )
                }
            }
        }
        .sheet(item: $parkToColor) { park in
            if #available(iOS 16.0, *) {
                ThemeColorPickerSheet(park: park)
                    .presentationDetents([.medium])
            } else {
                ThemeColorPickerSheet(park: park)
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
