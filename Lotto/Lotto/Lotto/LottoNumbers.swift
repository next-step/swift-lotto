//
//  LottoNumbers.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

class LottoNumbers {
    private var numbers: [LottoNumber]
    
    var count: Int {
        return numbers.count
    }
    
    var comparativeSet: Set<Int> {
        return Set<Int>(numbers.map({ $0.value }))
    }
    
    init(_ numbers: [LottoNumber]) {
        self.numbers = numbers
    }
}
