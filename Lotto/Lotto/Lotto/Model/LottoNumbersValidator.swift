//
//  LottoNumbersValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoNumbersValidator {
    
    enum LottoNumbersValidatorError: Error {
        case invalidNumberCount
        case containOutOfRange
        case hasDuplicate
    }
    
    enum Constants {
        static let count: Int = 6
        static let range: ClosedRange<Int> = 1...45
    }
    
    func validate(of numbers: [Int]) throws {
        guard numbers.count == Constants.count else {
            throw LottoNumbersValidatorError.invalidNumberCount
        }
        
        let isAllNumbersInRange = numbers.allSatisfy { number in
            Constants.range ~= number
        }
        guard isAllNumbersInRange else {
            throw LottoNumbersValidatorError.containOutOfRange
        }
        
        let isAllNumbersUnique = Set(numbers).count == numbers.count
        guard isAllNumbersUnique else {
            throw LottoNumbersValidatorError.hasDuplicate
        }
    }
}
