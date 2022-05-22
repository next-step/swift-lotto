//
//  CustomLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

struct CustomLotto: Lotto {
    var numbers: Set<LottoNumber>
    var validators: [LottoValidator] = [CountValidator(count: LottoConstant.numberCount),
                                        RangeValidator(range: LottoConstant.numberRange)]
    
    init<LottoNumberCollection: Collection>(numbers: LottoNumberCollection) throws where LottoNumberCollection.Element == Int {
        
        try validators.forEach { try $0.validate(numbers: numbers) }
        
        let lottoNumbers = numbers.map { LottoNumber($0) }
        self.numbers = Set(lottoNumbers)
    }
}
