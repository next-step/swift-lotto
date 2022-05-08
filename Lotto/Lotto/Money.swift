//
//  Monye.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct Money {
    let value: Int
    
    init?(value: Int) {
        if value < 0 { return nil }
        self.value = value
    }
}
