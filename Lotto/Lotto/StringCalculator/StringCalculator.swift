//
//  StringCalculator.swift
//  Lotto
//
//  Created by ycsong on 2022/05/04.
//

import Foundation

protocol Summable {
    static func sum(of values: [Int]) -> Int
}

struct StringCalculator: Summable {
    static func sum(of values: [Int]) -> Int {
        return values.reduce(0, +)
    }
}

enum StringCalculatorError: LocalizedError {
    case notNumber
    case nagativeNumber
    
    var errorDescription: String? {
        switch self {
        case .notNumber: return "숫자가 아님"
        case .nagativeNumber: return "음수 입력 에러"
        }
    }
}
