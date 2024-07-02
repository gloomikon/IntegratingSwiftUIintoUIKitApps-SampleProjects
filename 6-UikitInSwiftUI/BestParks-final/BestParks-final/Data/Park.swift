//
//  Park.swift
//  BestParks-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation
import CoreGraphics

class Park: Identifiable, ObservableObject {
    let id: UUID
    let name: String
    let description: String
    let image: String
    let imageDescription: String
    @Published var visitingDate: Date
    @Published var themeColor: CGColor?
    
    internal init(
        id: UUID,
        name: String,
        description: String,
        image: String,
        imageDescription: String,
        visitingDate: Date,
        themeColor: CGColor? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.imageDescription = imageDescription
        self.visitingDate = visitingDate
        self.themeColor = themeColor
    }
}
