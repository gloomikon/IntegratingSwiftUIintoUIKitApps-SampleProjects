//
//  MarkAsImportantButton.swift
//  FunActivities-final
//
//  Created by Natalia Panferova on 27/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct MarkAsImportantButton: View {
    @ObservedObject var activity: Activity
    
    var body: some View {
        Button {
            activity.isImportant.toggle()
        } label: {
            Label(
                activity.isImportant ?
                    "Mark as important" : "Unmark as important",
                systemImage: activity.isImportant ?
                    "star.slash" : "star"
            )
                .labelStyle(.iconOnly)
        }
        .tint(.mint)
    }
}

struct MarkAsImportantButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            MarkAsImportantButton(activity: Activity(
                id: UUID(),
                name: "Host a tea party",
                date: Date(),
                isImportant: false
            ))
            
            MarkAsImportantButton(activity: Activity(
                id: UUID(),
                name: "Go bird watching",
                date: Date(),
                isImportant: true
            ))
        }
        .font(.title)
        .imageScale(.large)
    }
}
