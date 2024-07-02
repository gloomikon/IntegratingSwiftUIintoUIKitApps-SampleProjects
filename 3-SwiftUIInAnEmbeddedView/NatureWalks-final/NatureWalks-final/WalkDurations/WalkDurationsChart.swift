//
//  WalkDurationsChart.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI
import Charts

@available(iOS 16, *)
struct WalkDurationsChart: View {
    @ObservedObject var walkDurations: WalkDurations
    
    private var durationsToChart: [WalkDuration] {
        if walkDurations.sortingIsOn {
            return walkDurations.sorted
        } else {
            return walkDurations.original
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nature walk durations in hours:")
                .font(.caption)
            Chart(durationsToChart, id: \.title) { walk in
                BarMark(
                    x: .value(
                        "Duration",
                        PlottableMeasurement(measurement: walk.duration)
                    ),
                    y: .value(
                        "Walk",
                        walk.title
                    )
                )
            }
            .chartXAxis {
                AxisMarks { value in
                    if let duration = value
                        .as(PlottableMeasurement.self)?.measurement
                    {
                        AxisValueLabel(duration.formatted())
                    }
                }
            }
            .animation(.default, value: walkDurations.sortingIsOn)
        }
    }
}

struct WalkDurationsChart_Previews: PreviewProvider {
    private static var durations: WalkDurations {
        let result = WalkDurations()
        result.original = WalksController().walks
            .map {
                WalkDuration(
                    title: $0.title,
                    duration: $0.duration
                )
            }
        return result
    }
    
    static var previews: some View {
        if #available(iOS 16, *) {
            WalkDurationsChart(walkDurations: durations)
                .frame(height: 300)
                .padding()
        } else {
            Text("The chart is only available in iOS 16")
        }
    }
}
