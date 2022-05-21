//
//  Lotto.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct Lotto {
    
    enum Constants {
        static let price: Int = 1000
        static let numbersCount: Int = 6
        static let numberRange: ClosedRange<Int> = 1...45
    }
    
    private let lottoNumbersValidator = LottoNumbersValidator()
    let numbers: [LottoNumber]
    
    init(numbers: [LottoNumber]) throws {
        try lottoNumbersValidator.validate(of: numbers)
        self.numbers = numbers
    }
}

