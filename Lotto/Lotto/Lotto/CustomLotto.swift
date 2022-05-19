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
        try LottoNumberValidator.validateNumberCount(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: numbers)

        self.numbers = numberSet
    }
}
