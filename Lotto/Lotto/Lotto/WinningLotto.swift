//
//  WinningLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation


struct WinningLotto: Lotto {
    let numbers: Set<LottoNumber>
    let bonusNumber: LottoNumber
    let validators: [LottoValidator] = [RangeValidator(range: LottoConstant.numberRange),
                                        CountValidator.init(count: LottoConstant.numberCount)]
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers, bonusNumber: Int) throws where LottoNumbers.Element == Int {
        try validators.forEach { try $0.validate(numbers: numbers) }
        
        if let rangeValidator = validators.filter({ type(of: $0) == RangeValidator.self }).first {
            try rangeValidator.validate(numbers: [bonusNumber])
        }
        
        let lottoNumbers = numbers.map { LottoNumber($0) }
        self.numbers = Set(lottoNumbers)
        self.bonusNumber = LottoNumber(bonusNumber)
    }
    
    func checkBonusNumber(in lotto: Lotto) -> Bool {
        return lotto.contains(number: bonusNumber)
    }
}

extension WinningLotto {
    func equalNumberCount(with lotto: Lotto) -> Int {
        let count = lotto.numbers.filter {
            self.numbers.contains($0)
        }.count
        
        return count
    }
}
