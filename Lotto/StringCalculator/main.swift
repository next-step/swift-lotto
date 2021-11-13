//
//  main.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/13.
//

import Foundation

enum CalcalatorInputError: Error {
    case notInteger
}

class StringCalculator {
    func plus(input: String?) throws -> Int {
        guard let input = input,
              !input.isEmpty
        else {
            return 0
        }
        
        if let number = Int(input) {
            return number
        }
        
        let components = input.components(separatedBy: [",", ":"])
        let integers = components.compactMap { Int($0) }
        guard integers.count == components.count else {
            throw CalcalatorInputError.notInteger
        }
        
        return 1
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
