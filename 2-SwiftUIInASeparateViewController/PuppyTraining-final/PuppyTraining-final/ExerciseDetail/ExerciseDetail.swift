//
//  ExerciseDetail.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 15/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
    let exercise: Exercise
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                ExerciseDetailHeader(exercise: exercise)
                ExerciseSteps(steps: exercise.steps)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    private static let exercise = ExercisesController().exercises[0]
    
    static var previews: some View {
        NavigationStack {
            ExerciseDetail(exercise: exercise)
                .navigationTitle(exercise.title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
