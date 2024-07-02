//
//  DinnerWidgetEntryView.swift
//  DinnerWidgetExtension
//
//  Created by Natalia Panferova on 17/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI
import WidgetKit

struct DinnerWidgetEntryView: View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) private var family
    
    var body: some View {
        if #available(iOSApplicationExtension 16.0, *) {
            switch family {
            case .accessoryRectangular:
                AccessoryDinnerWidgetView(entry: entry)
            case .systemSmall:
                SmallDinnerWidgetView(entry: entry)
            default:
                MediumDinnerWidgetView(entry: entry)
            }
        } else {
            switch family {
            case .systemSmall:
                SmallDinnerWidgetView(entry: entry)
            default:
                MediumDinnerWidgetView(entry: entry)
            }
        }
    }
}

struct SmallDinnerWidgetView: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Spacer()
            
            TimeUntilDinnerView(dinnerDate: entry.dinnerDate)
                .padding(10)
                .background(
                    Rectangle().fill(.ultraThinMaterial)
                )
        }
        .widgetBackground(
             RecipeImage(recipe: entry.recipe)
        )
    }
}

struct MediumDinnerWidgetView: View {
    var entry: Provider.Entry
    
    var body: some View {
        HStack {
            Link(
                destination: RecipeController.recipeUrl
            ) {
                RecipeImage(recipe: entry.recipe)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text(entry.recipe.name)
                    .font(.headline)
                
                TimeUntilDinnerView(dinnerDate: entry.dinnerDate)
            }
            .padding()
        }
        .secondaryWidgetBackground()
    }
}

@available(iOSApplicationExtension 16.0, *)
struct AccessoryDinnerWidgetView: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.recipe.name)
                .font(.headline)
                .minimumScaleFactor(0.6)
                .privacySensitive()
                
            TimeUntilDinnerView(dinnerDate: entry.dinnerDate)
        }
        .clearWidgetBackground()
    }
}

struct TimeUntilDinnerView: View {
    var dinnerDate: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Time left until dinner:")
                .font(.caption)
                .bold()
            Text(dinnerDate, style: .relative)
                .font(.callout)
                .bold()
        }
        .minimumScaleFactor(0.6)
        .accessibilityElement(children: .combine)
    }
}

struct RecipeImage: View {
    let recipe: Recipe
        
    var body: some View {
        Image(recipe.image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .accessibilityLabel(recipe.imageDescription)
    }
}

extension View {
    @ViewBuilder
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOS 17.0, *) {
            self.containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            self.background(backgroundView)
        }
    }
    
    @ViewBuilder
    func secondaryWidgetBackground() -> some View {
        if #available(iOS 17.0, *) {
            self.containerBackground(.background.secondary, for: .widget)
        } else {
            self.background(Color(uiColor: .secondarySystemBackground))
        }
    }
    
    @ViewBuilder
    func clearWidgetBackground() -> some View {
        if #available(iOS 17.0, *) {
            self.containerBackground(.clear, for: .widget)
        } else {
            self
        }
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
