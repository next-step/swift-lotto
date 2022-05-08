//
//  Lotto.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct Lotto: Equatable {
    private(set) var numbers: [LottoNumber]
    
    static func == (lhs: Lotto, rhs: Lotto) -> Bool {
        lhs.numbers == rhs.numbers
    }
}
