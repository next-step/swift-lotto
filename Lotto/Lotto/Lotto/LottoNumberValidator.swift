//
//  LottoNumberValidator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

struct LottoNumberValidator<LottoNumbers: Collection> where LottoNumbers.Element == Int {
    
    static func validate(numbers: LottoNumbers) -> Bool {
        guard validateNumberCount(of: numbers) else { return false }
        return validateNumberRange(of: numbers)
    }
    
    private static func validateNumberCount(of numbers: LottoNumbers) -> Bool {
        
        let setNumbers = Set(numbers)
        return setNumbers.count == LottoConstant.numberCount
    }
    
    private static func validateNumberRange(of numbers: LottoNumbers) -> Bool {
        return numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
    }
}
