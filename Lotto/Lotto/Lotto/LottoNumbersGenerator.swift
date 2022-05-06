//
//  LottoNumbersGenerator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

class LottoNumbersGenerator {
    
    private enum Constants {
        static let count: Int = 6
        static let range: ClosedRange<Int> = 1...45
    }
    
    private var numbers: [Int] = []
    
    func generate() -> [Int] {
        while (numbers.count < Constants.count) {
            appendUniqueRandomNumber()
        }
        return numbers
    }
    
    private func appendUniqueRandomNumber() {
        let numberCandidate = Int.random(in: Constants.range)
        let isNumberUnique = !numbers.contains(numberCandidate)
        guard isNumberUnique else {
            return
        }
        numbers.append(numberCandidate)
    }
}
