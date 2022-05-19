//
//  LottoNumberValidator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct LottoNumberValidator<LottoNumbers: Collection> where LottoNumbers.Element == Int {
    
    static func validateNumberCount(of numbers: LottoNumbers) throws {
        let setNumbers = Set(numbers)
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(setNumbers.count)
        }
    }
    
    static func validateNumberRange(of numbers: LottoNumbers) throws {
        let result = numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
        guard result else { throw LottoError.invalidLottoNumber }
    }
}
