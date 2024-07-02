//
//  ExerciseSteps.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 15/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseSteps: View {
    let steps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Steps:")
            VStack(alignment: .leading, spacing: 4) {
                ForEach(
                    Array(zip(1..<steps.count, steps)),
                    id: \.0
                ) { count, step in
                    Text("\(count). \(step)")
                }
            }
        }
    }
}

struct ExerciseSteps_Previews: PreviewProvider {
    private static let controller = ExercisesController()
    
    static var previews: some View {
        ExerciseSteps(steps: controller.exercises[0].steps)
    }
}
