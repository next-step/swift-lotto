//
//  NumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol NumberGenerator {
    static func from(_ input: String?) throws -> Int
}

struct PositiveNumberGenerator: NumberGenerator {
    static func from(_ input: String?) throws -> Int {
        guard let input: String = input,
            input.isEmpty == false else {
            return 0
        }
        
        guard let number = Int(input) else {
            throw Self.Error.isNotNumber(input)
        }
        
        if number < 0 {
            throw Self.Error.isNegativeNumber(number)
        }
        
        return number
    }
    
    enum Error: LocalizedError {
        case isNotNumber(String)
        case isNegativeNumber(Int)
        
        var errorDescription: String? {
            switch self {
            case .isNotNumber(let value):
                return "\(value)는 숫자가 아닙니다."
            case .isNegativeNumber(let value):
                return "\(value)는 음수입니다."
            }
        }
    }
}
