//
//  DinnerEntry.swift
//  DinnerWidgetExtension
//
//  Created by Natalia Panferova on 17/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import WidgetKit

struct DinnerEntry: TimelineEntry {
    let date: Date
    let recipe: Recipe
    let dinnerDate: Date
    
    static var sampleEntry: DinnerEntry {
        let date = Date()
        let dinnerTime = DinnerTimeController.defaultDinnerTime
        let dinnerDate = Calendar.current.nextDate(
            after: date, matching: dinnerTime,
            matchingPolicy: .nextTime
        )!
        
        return DinnerEntry(
            date: date,
            recipe: RecipeController.sampleRecipe,
            dinnerDate: dinnerDate
        )
        
    }
}
