//
//  ParkListRow.swift
//  BestParksSwiftUI-starter
//
//  Created by Natalia Panferova on 3/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

@available(iOS 16, *)
struct ParkListRow: View {
    var park: Park
    
    var body: some View {
        NavigationLink(value: park.id) {
            ParkListRowView(park: park)
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
        } label: {
            ParkListRowView(park: park)
        }
    }
}

struct ParkListRowView: View {
    var park: Park
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(park.name)
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
