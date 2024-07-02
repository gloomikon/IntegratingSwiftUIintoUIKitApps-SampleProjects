//
//  DifficultyFilterList.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 15/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct DifficultyFilterList: View {
    @Binding var selection: Exercise.Difficulty?
    
    var body: some View {
        List(Exercise.Difficulty.allCases, id: \.self) { level in
            HStack {
                Text(level.description.capitalized)
                Spacer()

                if selection == level {
                    Image(systemName: "checkmark")
                }
            }
            .padding(.vertical, 8)
            .contentShape(.interaction, Rectangle())
            .onTapGesture {
                selection = level
            }
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isButton)
        }
        .listStyle(.plain)
    }
}

struct DifficultyFilterList_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyFilterList(selection: .constant(.medium))
    }
}
