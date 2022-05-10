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
        var generateNumbers: Set<Int> = []
        while generateNumbers.count < 6 {
            let number = Int.random(in: randomRange)
            generateNumbers.insert(number)
        }
        numbers = Array(generateNumbers).sorted(by: <)
    }

}
