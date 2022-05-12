//
//  StringAdditionCaculator.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

final class StringAdditionCaculator {
    
    private let validator: StringAdditionValidator = StringAdditionValidator()
    
    func caculate(input: String) throws -> Int {
        
        let separatedStringArray: [String] = separate(input: input)
        let numbers: [Int] = try separatedStringArray.map { try validator.validNumber(from: $0)}
        let total: Int = sum(of: numbers)
        return total
    }
    
    private func sum(of numbers: [Int]) -> Int {
        return numbers.reduce(0, +)
    }
    
    private func separate(input: String) -> [String] {
        let separatedStringArray = input.components(separatedBy: CharacterSet(charactersIn: ",:"))
        return separatedStringArray
    }
}

