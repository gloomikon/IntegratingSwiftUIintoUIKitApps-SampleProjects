//
//  ExerciseFilterView.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 14/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ExerciseFilterView: View {
    @Bindable var filterState: ExerciseFilterState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            DifficultyFilterList(selection: $filterState.selection)
                .navigationTitle("Filter Exercises")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Clear", role: .cancel) {
                            filterState.selection = nil
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    let filterState = ExerciseFilterState()
    return ExerciseFilterView(
        filterState: filterState
    )
}
