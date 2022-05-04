//
//  Validator.swift
//  Lotto
//
//  Created by ycsong on 2022/05/04.
//

class Validator {
    static func validNumber(from value: String?) throws -> Int {
        guard let value = value, value.isEmpty == false else {
            return 0
        }
        
        guard let number = Int(value) else {
            throw StringCalculatorError.notNumber
        }
        
        if number < 0 {
            throw StringCalculatorError.nagativeNumber
        }
        
        return number
    }
}
