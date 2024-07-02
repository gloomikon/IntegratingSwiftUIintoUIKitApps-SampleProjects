//
//  DinnerTimeController.swift
//  DinnerPlan-starter
//
//  Created by Natalia Panferova on 29/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

class DinnerTimeController {
    static private let dinnerTimeKey = "dinnerTime"
    static private let defaults = UserDefaults.standard
    static private let encoder = JSONEncoder()
    static private let decoder = JSONDecoder()
    
    static let defaultDinnerTime = DateComponents(hour: 19)
    
    static func saveDinnerTime(_ time: DateComponents) {
        guard let data = try? encoder.encode(time) else {
            return
        }
        
        defaults.set(data, forKey: dinnerTimeKey)
    }
    
    static func getDinnerTime() -> DateComponents {
        guard
            let data = defaults.data(forKey: dinnerTimeKey),
            let time = try? decoder.decode(DateComponents.self, from: data)
        else {
            return defaultDinnerTime
        }
        
        return time
    }
    
    static func nextDinnerDate(
        matching dinnerTime: DateComponents
    ) -> Date {
        Calendar.current.nextDate(
            after: Date(), matching: dinnerTime,
            matchingPolicy: .nextTime
        )!
    }
}
