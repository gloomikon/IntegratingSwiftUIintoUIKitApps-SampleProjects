//
//  LargeSymbol.swift
//  CoffeeCounter-final
//
//  Created by Natalia Panferova on 12/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import SwiftUI

struct LargeSymbol: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .font(.title)
            .imageScale(.large)
            .padding()
            .environment(\.colorScheme, .dark)
            .background(Color.indigo)
            .clipShape(Circle())
            .accessibilityHidden(true)
    }
}

struct LargeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        LargeSymbol(name: "cup.and.saucer")
    }
}
