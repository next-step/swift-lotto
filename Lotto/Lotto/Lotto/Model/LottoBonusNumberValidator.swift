//
//  LottoBonusNumberValidator.swift
//  Lotto
//
//  Created by Kang, Su Jin (강수진) on 2022/05/17.
//

import Foundation

struct LottoBonusNumberValidator {
    
    private let lottoNumbersValidator = LottoNumbersValidator()
    
    func validate(_ bonusNumber: LottoNumber, in winningLotto: Lotto) throws {
        try lottoNumbersValidator.validateNumberInRange(of: bonusNumber)
        let winningNumbersWithBonus = winningLotto.numbers + [bonusNumber]
        try lottoNumbersValidator.validateAllUniqueNumbers(of: winningNumbersWithBonus)
    }
}
