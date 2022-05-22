//
//  CustomLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

struct CustomLotto: Lotto {
    var numbers: Set<LottoNumber>
    
    init<LottoNumberCollection: Collection>(numbers: LottoNumberCollection) throws where LottoNumberCollection.Element == Int {
        
        try LottoNumberValidator.validateNumberCount(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: numbers)
        
        let lottoNumbers = numbers.map { LottoNumber($0) }
        self.numbers = Set(lottoNumbers)
    }
}
