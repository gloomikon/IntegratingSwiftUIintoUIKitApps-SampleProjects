//
//  ParkDetailView.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ParkDetailView: UIViewControllerRepresentable {
    @ObservedObject var park: Park
    
    func makeUIViewController(context: Context) -> ParkDetailViewController {
        let controller = UIStoryboard(name: "Main", bundle: .main)
            .instantiateViewController(withIdentifier: "ParkDetail")
                as! ParkDetailViewController
        controller.park = park
        return controller
    }
    
    func updateUIViewController(
        _ uiViewController: ParkDetailViewController,
        context: Context
    ) {
        guard let color = park.themeColor else {
            return
        }
        uiViewController.nameLabel.textColor = UIColor(
            cgColor: color
        )
    }
}

struct ParkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetailView(
            park: ParksController.sampleParks[0]
        )
    }
}
