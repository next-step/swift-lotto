//
//  LottoNumbers.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

class LottoNumbers {
    private var numbers: [LottoNumber]
    
    init(_ numbers: [LottoNumber]) {
        self.numbers = numbers
    }
    
    func pop() -> Int {
        return numbers.removeFirst().value
    }
}
