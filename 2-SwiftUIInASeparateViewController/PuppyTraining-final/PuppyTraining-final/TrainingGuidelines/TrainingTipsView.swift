//
//  TrainingTipsView.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 17/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct TrainingTipsView: View {
    let tips: [String]
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    private var columns: [GridItem] {
        if dynamicTypeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        } else {
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        }
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(tips, id: \.self) { tip in
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.yellow)
                    Text(tip)
                        .multilineTextAlignment(.center)
                        .padding(12)
                        .environment(\.colorScheme, .light)
                }
            }
        }
    }
}

struct TrainingTipsView_Previews: PreviewProvider {
    private static let controller = TrainingGuidelinesController()
    
    static var previews: some View {
        ScrollView {
            TrainingTipsView(tips: controller.trainingTips)
                .padding()
        }
    }
}
