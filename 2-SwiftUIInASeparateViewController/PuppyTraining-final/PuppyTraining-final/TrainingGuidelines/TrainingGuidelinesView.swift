//
//  TrainingGuidelinesView.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 16/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct TrainingGuidelinesView: View {
    private let controller = TrainingGuidelinesController()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    TrainingTipsView(
                        tips: controller.trainingTips
                    )
                    DailyExerciseChart(
                        exerciseTimes: controller.exerciseTimes
                    )
                }
                .padding()
            }
            .navigationTitle("Training Guidelines")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TrainingGuidelinesView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingGuidelinesView()
    }
}
