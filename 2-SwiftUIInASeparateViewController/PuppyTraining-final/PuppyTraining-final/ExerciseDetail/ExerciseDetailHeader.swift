//
//  ExerciseDetailHeader.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 15/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseDetailHeader: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            Text("Difficulty level: \(exercise.difficulty.description)")
                .foregroundColor(.secondary)
            Text(exercise.description)
                .font(.headline)
        }
    }
}

struct ExerciseDetailHeader_Previews: PreviewProvider {
    private static let controller = ExercisesController()
    
    static var previews: some View {
        ExerciseDetailHeader(exercise: controller.exercises[0])
    }
}
