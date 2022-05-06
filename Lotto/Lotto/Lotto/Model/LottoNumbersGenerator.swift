//
//  LottoNumbersGenerator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

class LottoNumbersGenerator {
    
    private var numbers: [Int] = []
    
    func generate() -> [Int] {
        while (numbers.count < LottoNumbersValidator.Constants.count) {
            appendUniqueRandomNumber()
        }
        return numbers
    }
    
    private func appendUniqueRandomNumber() {
        let numberCandidate = Int.random(in: LottoNumbersValidator.Constants.range)
        let isNumberUnique = !numbers.contains(numberCandidate)
        guard isNumberUnique else {
            return
        }
        numbers.append(numberCandidate)
    }
}
