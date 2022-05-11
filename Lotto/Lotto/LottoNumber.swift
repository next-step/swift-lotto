//
//  LottoNumber.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoNumber: Hashable {
    static let minValue = 1
    static let maxValue = 45
    
    let value: Int
    
    init?(_ value: Int) {
        guard (LottoNumber.minValue...LottoNumber.maxValue).contains(value) else {
            return nil
        }
        
        self.value = value
    }
}
