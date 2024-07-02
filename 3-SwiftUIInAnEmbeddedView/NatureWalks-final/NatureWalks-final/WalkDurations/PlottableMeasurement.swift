//
//  PlottableMeasurement.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 23/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation
import Charts

struct PlottableMeasurement<UnitType: Unit> {
    var measurement: Measurement<UnitType>
}

@available(iOS 16, *)
extension PlottableMeasurement: Plottable where UnitType == UnitDuration {
    var primitivePlottable: Double {
        self.measurement.converted(to: .hours).value
    }
    
    init?(primitivePlottable: Double) {
        self.init(
            measurement: Measurement(
                value: primitivePlottable,
                unit: .hours
            )
        )
    }
}
