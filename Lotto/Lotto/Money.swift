//
//  Monye.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct Money: Comparable {
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func / (lhs: Money, rhs: Money) -> Int {
        return lhs.value / rhs.value
    }
    
    private let zero = 0
    let value: Int
    
    init?(value: Int) {
        if value < zero { return nil }
        self.value = value
    }
}
