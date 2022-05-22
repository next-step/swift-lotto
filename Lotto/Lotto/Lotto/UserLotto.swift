//
//  UserLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct UserLotto: Lotto {
    let numbers: Set<LottoNumber>
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int  {
        
        try LottoNumberValidator.validateNumberCount(of: numbers)
        try LottoNumberValidator.validateNumberRange(of: numbers)
        
        let lottoNumbers = numbers.map({ LottoNumber($0) })
        self.numbers = Set(lottoNumbers)
    }
}
