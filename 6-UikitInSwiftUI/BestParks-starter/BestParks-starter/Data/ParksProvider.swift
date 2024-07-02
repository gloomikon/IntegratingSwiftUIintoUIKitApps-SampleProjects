//
//  ParksProvider.swift
//  BestParks-starter
//
//  Created by Natalia Panferova on 1/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

// Mock object that could be communicating with a server in a real app
actor ParksProvider {
    // This would load user specific data in a real app
    func loadParks(for userID: UUID) async -> [Park] {
        return []
    }
    
    func loadAvailableParks() async -> [Park] {
        return parksToSuggest
    }
    
    // This would save user specific data in a real app
    func saveParks(_ parks: [Park], for suer: UUID) async {
        print("Saving parks...")
    }
    
    private var parksToSuggest = [
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
        ),
        Park(
            id: UUID(uuidString: "8b83f4fb-58e8-4e2d-b501-6e1c22df15e3")!,
            name: "Fiordland",
            description: """
            The largest national park in New Zealand and a major part of the Te Wahipounamu World Heritage Site
            """,
            image: "fiordland",
            imageDescription: """
            Photograph of Lake Te Anau in Fiordland National Park
            """,
            visitingDate: Date()
        ),
        Park(
            id: UUID(uuidString: "0626be03-d4f2-4cff-8bd7-b54946e5f4a9")!,
            name: "Nelson Lakes",
            description: """
            A picturesque landscape of snow-covered mountains and alpine lakes in the north of New Zealand's South Island
            """,
            image: "nelson-lakes",
            imageDescription: """
            Photograph of a pier looking out over the water in Nelson Lakes National Park
            """,
            visitingDate: Date()
        ),
        Park(
            id: UUID(uuidString: "46f322a7-16ed-44ad-b5b4-395c77c7ab56")!,
            name: "Abel Tasman",
            description: """
            The smallest of New Zealand's national parks located Golden Bay and Tasman Bay / Te Tai-o-Aorere at the north end of the South Island.
            """,
            image: "abel-tasman",
            imageDescription: """
            Photograph of Totaranui beach in Abel Tasman National Nark
            """,
            visitingDate: Date()
        )
    ]
}
