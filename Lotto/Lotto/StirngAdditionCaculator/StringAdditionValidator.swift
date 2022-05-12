//
//  StringAdditionValidator.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

final class StringAdditionValidator {
    
    let converter: StringAdditionConverter = StringAdditionConverter()

    func validNumber(from value: String?) throws -> Int {
        guard !(value?.isEmpty ?? true) else { return 0 }
        
        guard let number = converter.convertToInteger(from: value) else {
            throw StringAdditionError.notNumber
        }
        try checkValidationNegative(number: number)
        return number
    }
    
    func checkValidationNegative(number: Int) throws {
        if number < 0 {
            throw StringAdditionError.negativeNumber
        }
    }
}
