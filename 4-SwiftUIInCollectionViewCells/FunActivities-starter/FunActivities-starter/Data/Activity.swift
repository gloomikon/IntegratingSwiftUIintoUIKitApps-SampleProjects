//
//  Activity.swift
//  FunActivities-starter
//
//  Created by Natalia Panferova on 26/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

struct Activity: Identifiable {
    let id: UUID
    let name: String
    let date: Date
    
    init(id: UUID, name: String, date: Date) {
        self.id = id
        self.name = name
        self.date = date
    }
}
