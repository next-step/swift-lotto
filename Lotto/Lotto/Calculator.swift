//
//  Calculator.swift
//  Lotto
//
//  Created by 조민호 on 2021/11/12.
//

import Foundation

enum StringOption {
    static let seperator = ",:"
}

enum InputError: Error {
    case valueIsInvalid
}

struct Calculator {
    func calculate(input: String) throws -> Int {
        let result = split(input: input)
        
        try checkInputValid(input: result)
        
        return add(input: result)
    }
    
    func split(input: String) -> [String] {
        input.components(separatedBy: CharacterSet(charactersIn: StringOption.seperator))
    }
    
    func add(input: [String]) -> Int {
        input.compactMap { num in
            Int(num)
        }.reduce(0) { prev, next in
            return prev + next
        }
    }
    
    func checkInputValid(input: [String]) throws {
        let convertInputToInt = input.compactMap { Int($0) }
        
        try convertInputToInt.forEach { num in
            guard num > 0 else { throw InputError.valueIsInvalid }
        }
    }
}
