//
//  LottoNumber.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct LottoNumber: Equatable, Comparable {
    private(set) var number: Int
    
    static func < (lhs: LottoNumber, rhs: LottoNumber) -> Bool {
        lhs.number > rhs.number
    }
}
