//
//  CoffeePhoto.swift
//  CoffeeCounter-final
//
//  Created by Natalia Panferova on 12/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct CoffeePhoto: View {
    @State private var current = 0
    
    private let images = [
        "coffee", "coffee-beans", "coffee-machine"
    ]
    private let descriptions = [
        "Three coffee cups in a row with heart-shaped frothed milk.",
        "Roasted coffee beans in a container.",
        "Coffee machine making an espresso."
    ]
    
    var body: some View {
        Image(images[current])
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .cornerRadius(20)
            .onTapGesture {
                current = (current + 1) % images.count
            }
            .accessibilityAddTraits(.isButton)
            .accessibilityHint("Switch to a different photo")
            .accessibilityValue(descriptions[current])
    }
}

struct CoffeePhoto_Previews: PreviewProvider {
    static var previews: some View {
        CoffeePhoto()
    }
}
