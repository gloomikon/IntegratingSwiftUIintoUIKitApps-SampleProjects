//
//  ExerciseDetailHeader.swift
//  PuppyTraining-starter
//
//  Created by Natalia Panferova on 14/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseDetailHeader: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            Text("""
            Difficulty level: \(exercise.difficulty.description)
            """)
                .foregroundColor(.secondary)
            Text(exercise.description)
                .font(.headline)
        }
    }
}

#Preview {
    ExerciseDetailHeader(
        exercise: ExercisesController().exercises[0]
    )
}
