//
//  Walk.swift
//  NatureWalks-starter
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

struct Walk: Hashable {
    let title: String
    let image: String
    let imageDescription: String
    let description: String
    let length: Measurement<UnitLength>
    let elevation: Measurement<UnitLength>
    let duration: Measurement<UnitDuration>
}
