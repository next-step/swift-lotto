//
//  LottoNumber.swift
//  Lotto
//
//  Created by Kang, Su Jin (강수진) on 2022/05/21.
//

import Foundation

struct LottoNumber: Hashable {
    
    let value: Int
    
    init(value: Int) throws {
        try LottoNumberValidator.validate(of: value)
        self.value = value
    }
}
