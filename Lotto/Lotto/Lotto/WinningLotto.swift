//
//  WinningLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation


class WinningLotto: Lotto {
    let bonusNumber: LottoNumber
  
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers, bonusNumber: Int) throws where LottoNumbers.Element == Int {
        
        guard LottoConstant.numberRange.contains(bonusNumber) else {
            throw LottoError.invalidLottoNumber
        }
        self.bonusNumber = LottoNumber(bonusNumber)
        
        try super.init(numbers: numbers)
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
