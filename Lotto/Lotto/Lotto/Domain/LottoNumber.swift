//
//  LottoNumber.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

struct LottoNumber {
    let value: Int
    
    init?(_ value: Int) {
        guard 1...45 ~= value else { return nil }
        self.value = value
    }
}
