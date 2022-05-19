//
//  WinningLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct WinningLotto: Lotto {
    var numbers: Set<Int>
    let bonusNumber: Int
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers, bonusNumber: Int) throws where LottoNumbers.Element == Int {
        let setNumbers = Set(numbers)
        
        try LottoNumberValidator.validateNumberCount(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: [bonusNumber])
       
        self.numbers = setNumbers
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
