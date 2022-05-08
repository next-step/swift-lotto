//
//  Double+Ext.swift
//  Lotto
//
//  Created by 카카오VX on 2022/05/01.
//

import Foundation

extension Double {
    var floorTwoDecimalPlaces: Double {
        (floor(self * 100)) / 100
    }
}
