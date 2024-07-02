//
//  ParksController+sample.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

extension ParksController {
    static let sampleParks = [
        Park(
            id: UUID(uuidString: "1b17faaa-9c64-411e-8e58-4b709b5f9030")!,
            name: "Arthur's Pass",
            description: """
            A national park in the heart of the Southern Alps/Kā Tiritiri o te Moana and a popular stop on the TranzAlpine route
            """,
            image: "arthurs-pass",
            imageDescription: """
            Photograph of a kea flying over the mountains in Arthur's Pass National Park.
            """,
            visitingDate: Date()
        ),
        Park(
            id: UUID(uuidString: "abef71a6-bc0a-4c48-9b1a-fd99be76273c")!,
            name: "Aoraki / Mount Cook",
            description: """
            A beautiful alpine park in the South Island of New Zealand popular for hiking and skiing
            """,
            image: "mount-cook",
            imageDescription: """
            Photograph of mountains covered in snow.
            """,
            visitingDate: Date()
        ),
        Park(
            id: UUID(uuidString: "e6806382-5210-4920-9b08-8c3062199589")!,
            name: "Whanganui",
            description: """
            A national park located in the North Island of New Zealand protecting the habitat of several thousand North Island brown kiwi
            """,
            image: "whanganui",
            imageDescription: """
            Photograph of ferns
            """,
            visitingDate: Date()
        )
    ]
    
    static var mockController: ParksController {
        let result = ParksController()
        result.parks = ParksController.sampleParks
        return result
    }
}
