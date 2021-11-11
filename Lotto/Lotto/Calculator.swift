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
    
}

struct Calculator {
    func calculate(input: String) -> Int {
        let result = split(input: input)
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
    
//    func checkInputValid(input: String) -> Result<String, Error> {
//        
//    }
}
