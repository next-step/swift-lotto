//
//  StringAdditionValidator.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation


final class StringAdditionValidator {
    
    let converter: StringAdditionConverter = StringAdditionConverter()
    
    func checkEmptyString(_ input: String?) -> Int {
        return converter.convertToInteger(from: input) ?? 0
        
    }
    
    func checkValidationIncorrectString(string: String) throws -> Int {
        guard let number = converter.convertToInteger(from: string) else {
            throw StringAdditionError.notNumberString
        }
        try validationNegative(number: number)
        return number
    }
    
    func validationNegative(number: Int) throws {
        if number < 0 {
            throw StringAdditionError.negativeNumber
        }
    }

}
