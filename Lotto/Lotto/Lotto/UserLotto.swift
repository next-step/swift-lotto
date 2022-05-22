//
//  UserLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct UserLotto: Lotto {
    let numbers: Set<LottoNumber>
    var validators: [LottoValidator] = [CountValidator(count: LottoConstant.numberCount),
                                        RangeValidator(range: LottoConstant.numberRange)]
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int  {
        try validators.forEach { try $0.validate(numbers: numbers) }
        
        let lottoNumbers = numbers.map({ LottoNumber($0) })
        self.numbers = Set(lottoNumbers)
    }
}
