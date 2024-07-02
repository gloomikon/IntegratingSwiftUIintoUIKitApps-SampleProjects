//
//  ExerciseDetail.swift
//  PuppyTraining-starter
//
//  Created by Natalia Panferova on 14/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
    let exercise: Exercise
    
    var body: some View {
        List {
            ExerciseDetailHeader(exercise: exercise)
            ExerciseSteps(steps: exercise.steps)
        }
        .listStyle(.grouped)
    }
}

#Preview {
    let exercise = ExercisesController().exercises[0]
    return NavigationStack {
        ExerciseDetail(exercise: exercise)
            .navigationTitle(exercise.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}
