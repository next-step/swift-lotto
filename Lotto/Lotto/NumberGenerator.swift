//
//  NumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol NumberGenerator {
    static func from(_ value: String) throws -> Int
}

struct PositiveNumberGenerator {
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
    
    static func from(_ value: String?) throws -> Int {
        guard let value = value else { return 0 }
        
        if value.isEmpty == true { return 0 }
        
        guard let number = Int(value) else {
            throw Self.Error.isNotNumber(value)
        }
        
        if number < 0 {
            throw Self.Error.isNegativeNumber(number)
        }
        
        return number
    }
}
