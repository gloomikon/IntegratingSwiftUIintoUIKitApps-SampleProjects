//
//  ThemeColorPicker.swift
//  BestParksSwiftUI-final
//
//  Created by Natalia Panferova on 4/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct ThemeColorPicker: UIViewRepresentable {
    @Binding var color: CGColor?
        
    func makeUIView(context: Context) -> ThemeColorPickerView {
        let view = ThemeColorPickerView()
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(
        _ uiView: ThemeColorPickerView, context: Context
    ) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: ThemeColorPickerDelegate {
        var parent: ThemeColorPicker

        init(_ parent: ThemeColorPicker) {
            self.parent = parent
        }
        
        func themeColorPickerView(didSelectColor color: UIColor) {
            parent.color = color.cgColor
        }
    }
}

struct ThemeColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemeColorPicker(color: .constant(nil))
            .padding()
    }
}
