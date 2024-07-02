//
//  ThemeColorPickerSheet.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 4/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ThemeColorPickerSheet: View {
    @ObservedObject var park: Park
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ThemeColorPicker(color: $park.themeColor)
                .padding()
                .navigationTitle("Pick park theme color")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                    }
                }
        }
        .onChange(of: park.themeColor) { _ in
            dismiss()
        }
    }
}

struct ThemeColorPickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        ThemeColorPickerSheet(
            park: ParksController.sampleParks[0]
        )
    }
}
