//
//  LottoRankChecker.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoRankChecker {
    
    private let winningLotto: Lotto
    private let bonusNumber: Int
    private let lottoNumbersValidator = LottoNumbersValidator()
    
    init(winningLotto: Lotto, bonusNumber: Int) throws {
        try lottoNumbersValidator.validateBonusNumber(bonusNumber, in: winningLotto)
        
        self.winningLotto = winningLotto
        self.bonusNumber = bonusNumber
    }
    
    func rank(of lotto: Lotto) -> LottoRank {
        let matchNumberCount = matchNumberCount(of: lotto)
        let lottoRank = LottoRank.rank(matchNumberCount: matchNumberCount,
                                       isMatchBonus: lotto.numbers.contains(bonusNumber))
        return lottoRank
    }
    
    private func matchNumberCount(of lotto: Lotto) -> Int {
        let matchNumberCount = lotto.numbers.filter { number in
            winningLotto.numbers.contains(number)
        }
        .count
        return matchNumberCount
    }
}
