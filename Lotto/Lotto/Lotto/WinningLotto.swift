//
//  WinningLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct WinningLotto: Lotto {
    let numbers: Set<LottoNumber>
    let bonusNumber: Int
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers, bonusNumber: Int) throws where LottoNumbers.Element == Int {
        
        try LottoNumberValidator.validateNumberCount(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: [bonusNumber])
       
        let lottoNumbers = numbers.map { LottoNumber($0) }
        self.numbers = Set(lottoNumbers)
        self.bonusNumber = bonusNumber
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
