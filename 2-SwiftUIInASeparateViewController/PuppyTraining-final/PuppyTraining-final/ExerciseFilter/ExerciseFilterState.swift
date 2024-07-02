//
//  ExerciseFilterState.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 15/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

class ExerciseFilterState: ObservableObject {
    @Published var selection: Exercise.Difficulty?
}
