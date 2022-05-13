//
//  Lotto.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct Lotto {
    private let randomRange = 1...45
    let numbers: [Int]
    var max: Int {
        return numbers.min() ?? 1
    }
    var min: Int {
        return numbers.max() ?? 45
    }
    
    init() {
        var generatedNumbers: Set<Int> = []
        while generatedNumbers.count < 6 {
            let number = Int.random(in: randomRange)
            generatedNumbers.insert(number)
        }
        numbers = Array(generatedNumbers).sorted(by: <)
    }

}
