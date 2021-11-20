//
//  main.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/13.
//

import Foundation

enum CalcalatorInputError: Error {
    case notInteger
    case minusInteger
}

class StringCalculator {
    func plus(input: String?) throws -> Int {
        guard !isEmpty(input) else { return 0 }
        if let number = try isInteger(input) { return number }
        
        let components = (input ?? "").components(separatedBy: [",", ":"])
        let integers = components.compactMap { Int($0) }
        
        try checkInArrayNotInteger(integers: integers, stringComponents: components)
        try checkInArrayMinus(integers: integers, stringComponents: components)
        return integers.reduce(0) { result, integer in
            result + integer
        }
    }
    
    private func isEmpty(_ input: String?) -> Bool {
        guard let input = input,
              !input.isEmpty
        else {
            return true
        }
        
        return false
    }
    
    private func isInteger(_ input: String?) throws -> Int? {
        guard let input = input,
              let number = Int(input)
        else { return nil }
        guard number > 0 else { throw CalcalatorInputError.minusInteger }
        
        return number
    }
    
    private func checkInArrayNotInteger(integers: [Int], stringComponents: [String]) throws {
        guard integers.count == stringComponents.count else {
            throw CalcalatorInputError.notInteger
        }
    }
    
    private func checkInArrayMinus(integers: [Int], stringComponents: [String]) throws {
        guard !integers.contains(where: { $0 < 0 }) else {
            throw CalcalatorInputError.minusInteger
        }
    }
}

extension String {
    func components(separatedBy separators: [String]) -> [String] {
        var output: [String] = [self]
        for separator in separators {
            output = output.flatMap { $0.components(separatedBy: separator) }
        }
        return output
    }
}
