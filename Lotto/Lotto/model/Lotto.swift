//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

enum LottoError: Error {
    case autoGenerateError
}

class Lotto {
    var numbers: [Int]

    init(numbers: [Int]) {
        self.numbers = numbers
    }
}
