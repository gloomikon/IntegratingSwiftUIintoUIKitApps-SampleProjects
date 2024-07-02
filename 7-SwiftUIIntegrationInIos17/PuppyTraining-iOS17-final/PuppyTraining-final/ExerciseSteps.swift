//
//  ExerciseSteps.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 14/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseSteps: View {
    let steps: [String]
    
    var body: some View {
        Section("Steps") {
            ForEach(
                Array(zip(1..<steps.count, steps)),
                id: \.0
            ) { count, step in
                Label(
                    title: { Text(step) },
                    icon: { Image(systemName: "\(count).circle") }
                )
            }
        }
    }
}

#Preview {
    List {
        ExerciseSteps(
            steps: ExercisesController().exercises[0].steps
        )
    }.listStyle(.grouped)
}
