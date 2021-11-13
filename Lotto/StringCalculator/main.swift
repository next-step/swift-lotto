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
        guard let input = input,
              !input.isEmpty
        else {
            return 0
        }
        
        if let number = Int(input) {
            if number < 0 {
                throw CalcalatorInputError.minusInteger
            }
            return number
        }
        
        let components = input.components(separatedBy: [",", ":"])
        let integers = components.compactMap { Int($0) }
        
        guard integers.count == components.count else {
            throw CalcalatorInputError.notInteger
        }
        
        guard !integers.contains(where: { $0 < 0 }) else {
            throw CalcalatorInputError.minusInteger
        }
        
        return integers.reduce(0) { result, integer in
            result + integer
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
