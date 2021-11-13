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
        if let number = try checkEmptyAndInteger(input) {
            return number
        }
        
        let components = (input ?? "").components(separatedBy: [",", ":"])
        let integers = components.compactMap { Int($0) }
        
        try checkNotIntegerAndMinus(integers: integers, stringComponents: components)
        return integers.reduce(0) { result, integer in
            result + integer
        }
    }
    
    private func checkEmptyAndInteger(_ input: String?) throws -> Int? {
        guard let input = input,
              !input.isEmpty
        else {
            return 0
        }
        
        guard let number = Int(input) else { return nil }
        guard number > 0 else { throw CalcalatorInputError.minusInteger }
        
        return number
    }
    
    private func checkNotIntegerAndMinus(integers: [Int], stringComponents: [String]) throws {
        guard integers.count == stringComponents.count else {
            throw CalcalatorInputError.notInteger
        }
        
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
