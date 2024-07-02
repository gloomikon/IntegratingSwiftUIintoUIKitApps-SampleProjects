//
//  WalkDurations.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

struct WalkDuration {
    let title: String
    let duration: Measurement<UnitDuration>
}

class WalkDurations: ObservableObject {
    @Published var sortingIsOn = false
    var original: [WalkDuration] = []
    lazy var sorted: [WalkDuration] = {
        original.sorted(
            using: KeyPathComparator(\WalkDuration.duration)
        )
    }()
}
