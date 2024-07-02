//
//  CustomThemeTrait.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 14/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit
import SwiftUI

struct CustomThemeTrait: UITraitDefinition {
    static let defaultValue = false
    static let affectsColorAppearance: Bool = true
}

extension UIMutableTraits {
    var customThemeEnabled: Bool {
        get {
            self[CustomThemeTrait.self]
        }
        set {
            self[CustomThemeTrait.self] = newValue
        }
    }
}

extension UITraitCollection {
    var customThemeEnabled: Bool {
        self[CustomThemeTrait.self]
    }
}

struct CustomThemeKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var customThemeEnabled: Bool {
        get {
            self[CustomThemeKey.self]
        }
        set {
            self[CustomThemeKey.self] = newValue
        }
    }
}

extension CustomThemeKey: UITraitBridgedEnvironmentKey {
    static func read(from traitCollection: UITraitCollection) -> Bool {
        traitCollection.customThemeEnabled
    }
    
    static func write(to mutableTraits: inout UIMutableTraits, value: Bool) {
        mutableTraits.customThemeEnabled = value
    }
}
