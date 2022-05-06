//
//  LottoNumbersGenerator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoNumbersGenerator {
    func generate() -> [Int] {
        var numbers: [Int] = []
        while (numbers.count < LottoNumbersValidator.Constants.count) {
            let numberCandidate = Int.random(in: LottoNumbersValidator.Constants.range)
            let isNumberUnique = !numbers.contains(numberCandidate)
            guard isNumberUnique else {
                continue
            }
            numbers.append(numberCandidate)
        }
        return numbers
    }
}
