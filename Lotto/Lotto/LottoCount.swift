//
//  LottoCount.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/20.
//

import Foundation

struct LottoCount {
    private let zero = 0
    let value: Int
    
    init?(_ value: Int) {
        if value < zero { return nil }
        self.value = value
    }
}
