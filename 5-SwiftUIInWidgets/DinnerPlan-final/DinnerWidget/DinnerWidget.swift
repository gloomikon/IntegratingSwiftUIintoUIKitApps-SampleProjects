//
//  DinnerWidget.swift
//  DinnerWidget
//
//  Created by Natalia Panferova on 17/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//


import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DinnerEntry {
        DinnerEntry.sampleEntry
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (DinnerEntry) -> ()
    ) {
        if context.isPreview {
            // Show a widget with generic data
            let entry = DinnerEntry.sampleEntry
            completion(entry)
            return
        }
        
        Task {
            let entry = await fetchDinnerEntry()
            completion(entry)
        }
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<DinnerEntry>) -> ()
    ) {
        Task {
            let entry = await fetchDinnerEntry()
            let timeline = Timeline(
                entries: [entry],
                policy: .after(entry.dinnerDate)
            )
            completion(timeline)
        }
    }
    
    private func fetchDinnerEntry() async -> DinnerEntry {
        let date = Date()
        let dinnerTime = DinnerTimeController.getDinnerTime()
        let recipe = await RecipeController
            .getRecipeOfTheDay(for: dinnerTime)
        let dinnerDate = DinnerTimeController
            .nextDinnerDate(matching: dinnerTime)
        
        return DinnerEntry(
            date: date,
            recipe: recipe,
            dinnerDate: dinnerDate
        )
    }
}

struct DinnerWidget: Widget {
    let kind: String = "DinnerWidget"

    private var supportedFamilies: [WidgetFamily] {
        if #available(iOSApplicationExtension 16.0, *) {
            return [
                .systemSmall, .systemMedium,
                .accessoryRectangular
            ]
        } else {
            return [.systemSmall, .systemMedium]
        }
    }
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            DinnerWidgetEntryView(entry: entry)
        }
        
        .contentMarginsDisabled()
        .configurationDisplayName("Dinner Widget")
        .description("""
        Shows the dinner dish and the time left until dinner.
        """)
        
        .supportedFamilies(supportedFamilies)
    }
}

@available(iOS 17, *)
#Preview(as: .systemSmall) {
    DinnerWidget()
} timeline: {
    DinnerEntry.sampleEntry
}

@available(iOS 17, *)
#Preview(as: .systemMedium) {
    DinnerWidget()
} timeline: {
    DinnerEntry.sampleEntry
}

@available(iOS 17, *)
#Preview(as: .accessoryRectangular) {
    DinnerWidget()
} timeline: {
    DinnerEntry.sampleEntry
}
