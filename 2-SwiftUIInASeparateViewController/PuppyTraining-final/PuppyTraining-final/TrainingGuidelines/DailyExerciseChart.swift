//
//  DailyExerciseChart.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 17/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI
import Charts

struct DailyExerciseChart: View {
    let exerciseTimes: [ExerciseTime]
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    private var chartHeight: Double {
        dynamicTypeSize.isAccessibilitySize ? 500 : 200
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended daily exercise in minutes for age in months:")
            Chart(exerciseTimes) { time in
                LineMark(
                    x: .value(
                        "Puppy age in months",
                        time.ageInMonths
                    ),
                    y: .value(
                        "Exercise minutes per day",
                        time.dailyExerciseInMinutes
                    )
                )
            }
            .frame(height: chartHeight)
        }
    }
}

struct DailyExerciseChart_Previews: PreviewProvider {
    private static let controller = TrainingGuidelinesController()

    static var previews: some View {
        ScrollView {
            DailyExerciseChart(
                exerciseTimes: controller.exerciseTimes
            )
            .padding()
        }
    }
}
