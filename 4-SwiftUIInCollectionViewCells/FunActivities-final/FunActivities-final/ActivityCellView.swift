//
//  ActivityCellView.swift
//  FunActivities-final
//
//  Created by Natalia Panferova on 26/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ActivityCellView: View {
    @ObservedObject var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(
                    activity.date,
                    format: .dateTime
                        .day()
                        .month(.abbreviated)
                )
                .font(.caption)
                .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .opacity(
                        activity.isImportant ? 1 : 0
                    )
            }
            
            Text(activity.name)
                .font(.headline)
                .alignmentGuide(.listRowSeparatorLeading) {
                    $0[.leading]
                }
                .padding(.leading, 20)
        }
        .padding(.vertical)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("""
            \(activity.name) \(
                activity.date,
                format: .dateTime
                    .day()
                    .month(.abbreviated)
            ) \(activity.isImportant ? "is important" : "")
        """)
    }
}

struct ActivityCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ActivityCellView(
                activity: Activity(
                    id: UUID(),
                    name: "Try a new recipe for dinner",
                    date: Date()
                )
            )
            ActivityCellView(
                activity: Activity(
                    id: UUID(),
                    name: "Go bird watching",
                    date: Date(),
                    isImportant: true
                )
            )
        }
    }
}
