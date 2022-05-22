//
//  LottoValidator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/22.
//

import Foundation

protocol LottoValidator {
    func validate<LottoNumbers>(numbers: LottoNumbers) throws
    where LottoNumbers: Collection, LottoNumbers.Element == Int
}

struct RangeValidator: LottoValidator {
    let range: ClosedRange<Int>
     
    func validate<LottoNumbers>(numbers: LottoNumbers) throws where LottoNumbers : Collection, LottoNumbers.Element == Int {
      
        let result = numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
        guard result else { throw LottoError.invalidLottoNumber }
    }
}

struct CountValidator: LottoValidator {
    let count: Int
    
    func validate<LottoNumbers>(numbers: LottoNumbers) throws where LottoNumbers : Collection, LottoNumbers.Element == Int {
        let setNumbers = Set(numbers)
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(setNumbers.count)
        }
    }
}
