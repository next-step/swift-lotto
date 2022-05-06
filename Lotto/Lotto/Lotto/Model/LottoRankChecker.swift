//
//  LottoRankChecker.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoRankChecker {
    
    private let winningNumbers: [Int]
    private let lottoNumbersValidator = LottoNumbersValidator()
    
    init(winningNumbers: [Int]) throws {
        try lottoNumbersValidator.validate(of: winningNumbers)
        self.winningNumbers = winningNumbers
    }
    
    func rank(of numbers: [Int]) throws -> LottoRank {
        try lottoNumbersValidator.validate(of: numbers)
        
        let matchNumberCount = matchNumberCount(of: numbers)
        let lottoRank = LottoRank.rank(matchNumberCount: matchNumberCount)
        return lottoRank
    }
    
    private func matchNumberCount(of numbers: [Int]) -> Int {
        let matchNumberCount = numbers.filter { number in
            winningNumbers.contains(number)
        }
        .count
        return matchNumberCount
    }
}
