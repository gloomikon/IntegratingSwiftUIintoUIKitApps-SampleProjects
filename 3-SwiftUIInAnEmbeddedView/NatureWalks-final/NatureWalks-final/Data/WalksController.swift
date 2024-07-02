//
//  WalksController.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

class WalksController {
    let walks = [
        Walk(
            title: "Bottle Lake Forest",
            image: "bottle-lake-forest",
            imageDescription: """
            Forest with tall trees and sunlight coming through the branches.
            """,
            description: """
            Great place to walk on a hot day as the track is almost entirely in the shade.
            """,
            length: Measurement(value: 11.4, unit: .kilometers),
            elevation: Measurement(value: 160, unit: .meters),
            duration: Measurement(value: 2, unit: .hours)
        ),
        Walk(
            title: "Avon River Trail",
            image: "avon-trail",
            imageDescription: """
            Avon river in summer with green trees on the sides
            """,
            description: """
            Shared-use trail for cyclists and pedestrians that goes through the center of Christchurch.
            """,
            length: Measurement(value: 11, unit: .kilometers),
            elevation: Measurement(value: 26, unit: .meters),
            duration: Measurement(value: 2.5, unit: .hours)
        ),
        Walk(
            title: "Crater Rim Walkway",
            image: "crater-rim",
            imageDescription: """
            View over the harbor from the Crater Rim walkway
            """,
            description: """
            Challenging route with beautiful views over Lyttelton Harbour.
            """,
            length: Measurement(value: 16.3, unit: .kilometers),
            elevation: Measurement(value: 620, unit: .meters),
            duration: Measurement(value: 5, unit: .hours)
        ),
        Walk(
            title: "Hagley Park Loop",
            image: "hagley-park",
            imageDescription: """
            Lake with waterbirds next to a walkway in the park
            """,
            description: """
            Popular trail for hiking and road biking, but can be quiet during the work hours.
            """,
            length: Measurement(value: 5.8, unit: .kilometers),
            elevation: Measurement(value: 92, unit: .meters),
            duration: Measurement(value: 1, unit: .hours)
        )
    ]
}
