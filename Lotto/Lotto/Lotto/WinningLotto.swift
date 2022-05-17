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
        
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(numbers.count)
        }
        
        let hasValidNumbers = numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
        if hasValidNumbers == false {
            throw LottoError.invalidLottoNumber
        }
    
        if bonusNumber < 0 { throw LottoError.invalidLottoNumber }
        self.numbers = setNumbers
        self.bonusNumber = bonusNumber
    }
    
    func checkBonusNumber(in lotto: Lotto) -> Bool {
        let count = lotto.numbers.filter { $0 == bonusNumber }.count
        return count > 0
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
