//
//  SplitViewDetailView.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

// this view is only used in split view in iOS 16
@available(iOS 16, *)
struct SplitViewDetailView: View {
    @EnvironmentObject
    private var parksController: ParksController
    
    var selectedParkID: UUID?
    
    private var selectedPark: Park? {
        if let selection = selectedParkID {
            return parksController.park(for: selection)
        } else {
            return nil
        }
    }
    
    var body: some View {
        ZStack {
            if let park = selectedPark {
                ParkDetailView(park: park)
            } else {
                EmptySelectionView()
            }
        }
    }
}

@available(iOS 16, *)
struct SplitViewDetailView_Previews: PreviewProvider {
    static let controller = ParksController.mockController
    
    static var previews: some View {
        SplitViewDetailView(
            selectedParkID: controller.parks[0].id
        )
            .environmentObject(controller)
    }
}
