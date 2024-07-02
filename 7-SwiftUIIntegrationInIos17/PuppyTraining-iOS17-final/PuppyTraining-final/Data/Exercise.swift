//
//  Exercise.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 14/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

struct Exercise: Hashable {
    enum Difficulty: CaseIterable {
        case easy
        case medium
        case hard
        
        var description: String {
            switch self {
            case .easy: return "easy"
            case .medium: return "medium"
            case .hard: return "hard"
            }
        }
    }
    
    let title: String
    let description: String
    let difficulty: Difficulty
    let steps: [String]
    
    private let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
