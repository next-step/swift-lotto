//
//  LottoNumber.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/20.
//

import Foundation

struct LottoNumber: Hashable {
    let value: Int
    
    init(_ value: Int) { self.value = value }
}

extension LottoNumber: Comparable {
    static func < (lhs: LottoNumber, rhs: LottoNumber) -> Bool {
        lhs.value < rhs.value
    }
}
