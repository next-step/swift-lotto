//
//  LottoInputManager.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/21.
//

import Foundation

struct LottoInputValidator {
    func validateLottoNumbersCount(_ numbers: [Int]) throws {
        try countValid(numbers)
        try duplicateValid(numbers)
    }
    
    func validateNumbersRange(_ numbers: [Int]) throws {
        for number in numbers {
            try validateNumberRange(number)
        }
    }
    
    func validateNumberRange(_ number: Int) throws {
        guard number >= 1 , number <= 45 else {
            throw InputError.invalidNumber
        }
    }
    
    func validatePositive(_ number: Int) throws {
        guard number >= 0 else {
            throw InputError.negativeNumber
        }
    }
    
    private func countValid(_ numbers: [Int]) throws {
        guard numbers.count == 6 else {
            throw InputError.invalidNumberCount
        }
    }
    private func duplicateValid(_ numbers: [Int]) throws {
        guard Set(numbers).count == 6 else {
            throw InputError.duplicateNumber
        }
    }
}
