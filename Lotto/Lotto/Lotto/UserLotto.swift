//
//  UserLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct LottoNumberValidator {
    static func validate<LottoNumbers: Collection>(numbers: LottoNumbers) -> Bool where LottoNumbers.Element == Int {
        
        return numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
    }
}

struct UserLotto: Lotto {
    let numbers: Set<Int>
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int  {
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
    
        self.numbers = setNumbers
    }
}

