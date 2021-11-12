//
//  Calculator.swift
//  Lotto
//
//  Created by 조민호 on 2021/11/12.
//

import Foundation

enum SplitOption: String, CaseIterable {
    case comma = ","
    case colon = ":"
    
    static func combineSplitOption() -> String {
        allCases.map { ($0.rawValue) }.joined()
    }
}

enum InputError: Error {
    case valueIsInvalid
}

struct Calculator {
    func calculate(input: String) throws -> Int {
        let splitInput = split(input: input)
        
        try checkInputValid(input: splitInput)
        
        return add(input: splitInput)
    }
    
    func split(input: String) -> [String] {
        input.components(separatedBy: CharacterSet(charactersIn: SplitOption.combineSplitOption()))
    }
    
    func add(input: [String]) -> Int {
        guard !input.isEmpty, input != [""] else { return 0 }
        
        return input.compactMap { num in
            Int(num)
        }.reduce(0) { prev, next in
            return prev + next
        }
    }
    
    func checkInputValid(input: [String]) throws {
        try convertInputToInt(input: input).forEach { num in
            guard num > 0 else { throw InputError.valueIsInvalid }
        }
    }
    
    func convertInputToInt(input: [String]) -> [Int] {
        input.compactMap { Int($0) }
    }
}
