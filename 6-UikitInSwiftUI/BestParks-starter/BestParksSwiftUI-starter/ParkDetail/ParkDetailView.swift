//
//  ParkDetailView.swift
//  BestParksSwiftUI-starter
//
//  Created by Natalia Panferova on 3/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ParkDetailView: View {
    var park: Park
    
    var body: some View {
        Text("Park detail view placeholder for \(park.name)")
    }
}

struct ParkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetailView(
            park: ParksController.sampleParks[0]
        )
    }
}
