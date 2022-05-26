//
//  LottoCount.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/20.
//

import Foundation

struct LottoCount {
    static let zero = LottoCount(0)!
    let value: Int
    
    init?(_ value: Int) {
        if value < 0 { return nil }
        self.value = value
    }
}
