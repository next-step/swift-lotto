//
//  UserLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct UserLotto: Lotto {
    let numbers: Set<Int>
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int  {
        let setNumbers = Set(numbers) 
        
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(numbers.count)
        }

        if numbers.canBeLottoNumbers() == false { throw LottoError.invalidLottoNumber }

        self.numbers = setNumbers
    }
}
