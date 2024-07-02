//
//  Activity.swift
//  FunActivities-final
//
//  Created by Natalia Panferova on 26/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

class Activity: Identifiable, ObservableObject {
    let id: UUID
    let name: String
    let date: Date
    @Published var isImportant = false
    
    init(
        id: UUID, name: String,
        date: Date, isImportant: Bool = false
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.isImportant = isImportant
    }
}
