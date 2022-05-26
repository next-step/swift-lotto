//
//  WinningLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation


class WinningLotto: Lotto {
    let bonusNumber: LottoNumber
  
    
    init?<LottoNumbers: Collection>(numbers: LottoNumbers, bonusNumber: Int) where LottoNumbers.Element == Int {
        self.bonusNumber = LottoNumber(bonusNumber)
        
        super.init(numbers: numbers)
        
        guard (try? validateRange(number: bonusNumber)) != nil,
              (try? validateRange(numbers: numbers)) != nil,
              (try? validateCount(numbers: numbers)) != nil else {
                  return nil
              }
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
