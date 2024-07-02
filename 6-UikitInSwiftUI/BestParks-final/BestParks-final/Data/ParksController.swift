//
//  ParksController.swift
//  BestParks-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

@MainActor
class ParksController: ObservableObject {
    @Published var parks: [Park] = []
    var isLoaded = false
    
    private var parksToSuggest: [Park] = []
    private let parksProvider = ParksProvider()
    
    var canAddParks: Bool {
        !parksToSuggest.isEmpty
    }
    
    func park(for id: UUID) -> Park? {
        parks.first { $0.id == id }
    }
    
    func loadParks() async {
        parksToSuggest = await parksProvider.loadAvailableParks()
        
        // This would load user specific data in a real app
        let parksForUser = await parksProvider.loadParks(for: UUID())
        
        if parksForUser.isEmpty {
            for _ in 0...2 {
                addPark()
            }
        } else {
            parks = parksForUser
        }
        
        isLoaded = true
    }
    
    // This would save user specific data in a real app
    func saveParks() async {
        await parksProvider.saveParks(parks, for: UUID())
    }
    
    func addPark() {
        guard !parksToSuggest.isEmpty else { return }
        let parkToAdd = parksToSuggest.removeFirst()
        parkToAdd.visitingDate = nextVisitingDate()
        parks.append(parkToAdd)
    }
    
    func deletePark(id: Park.ID) {
        guard let indexToRemove = parks.firstIndex(
            where: { $0.id == id })
        else { return }
        
        let park = parks[indexToRemove]
        parks.remove(at: indexToRemove)
        park.themeColor = nil
        parksToSuggest.append(park)
    }
    
    private func nextVisitingDate() -> Date {
        guard
            let lastDate = parks.last?.visitingDate
        else {
            return Calendar.current.date(
                byAdding: .day, value: 10, to: Date()
            ) ?? Date()
        }
        
        return Calendar.current.date(
            byAdding: .day, value: 10, to: lastDate
        ) ?? Date()
    }
}

extension ParksController {
    static let parkIDsUserInfoKey = "parkIDs"
}

extension NSNotification.Name {
    static let parksDidChange = Notification.Name(
        "com.example.BestParks-final.parksDidChanged"
    )
}
