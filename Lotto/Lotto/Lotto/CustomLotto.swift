//
//  CustomLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

struct CustomLotto: Lotto {
    var numbers: Set<Int>
    
    init<LottoNumberCollection: Collection>(numbers: LottoNumberCollection) throws where LottoNumberCollection.Element == Int {
        let numberSet = Set(numbers)
        guard LottoConstant.numberCount == numberSet.count else {
            throw LottoError.invalidNumberCount(numberSet.count)
        }
        
        try numberSet.forEach {
            if LottoConstant.numberRange.contains($0) == false {
                throw LottoError.invalidLottoNumber
            }
        }
        
        guard LottoNumberValidator.validate(numbers: numbers) == true else {
            throw LottoError.invalidLottoNumber
        }
        
        self.numbers = numberSet
    }
}
