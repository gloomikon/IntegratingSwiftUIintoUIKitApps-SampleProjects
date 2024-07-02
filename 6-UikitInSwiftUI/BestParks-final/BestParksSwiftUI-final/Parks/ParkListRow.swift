//
//  ParkListRow.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

@available(iOS 16, *)
struct ParkListRow: View {
    var park: Park
    var selectedParkID: UUID?
    
    var body: some View {
        NavigationLink(value: park.id) {
            ParkListRowView(
                park: park,
                selectedParkID: selectedParkID
            )
        }
    }
}

struct LegacyParkListRow: View {
    var park: Park
    @Binding var selectedParkID: UUID?
    
    var body: some View {
        NavigationLink(
            tag: park.id,
            selection: $selectedParkID
        ) {
            ParkDetailView(park: park)
                .navigationBarTitleDisplayMode(.inline)
        } label: {
            ParkListRowView(
                park: park,
                selectedParkID: selectedParkID
            )
        }
    }
}

struct ParkListRowView: View {
    @ObservedObject var park: Park
    var selectedParkID: UUID?
    
    private var themeColor: Color? {
        if let color = park.themeColor {
            return Color(cgColor: color)
        }
        return nil
    }
    
    private var parkNameColor: Color? {
        if park.id == selectedParkID {
            return nil
        }
        
        return themeColor
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(park.name)
                .foregroundColor(parkNameColor)
            Text(
            """
            Visiting date: \(
                park.visitingDate,
                format: .dateTime.day().month().year()
            )
            """
            )
            .font(.caption)
        }
    }
}

struct ParkListRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            if #available(iOS 16.0, *) {
                ParkListRow(
                    park: ParksController.sampleParks[0]
                )
            } else {
                LegacyParkListRow(
                    park: ParksController.sampleParks[0],
                    selectedParkID: .constant(nil)
                )
            }
        }
    }
}
