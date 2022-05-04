//
//  StringCalculator.swift
//  Lotto
//
//  Created by ycsong on 2022/05/04.
//

import Foundation

protocol Summable {
    func sum() throws -> Int
}

extension Array: Summable where Element == Int {
    func sum() throws -> Int {
        return self.reduce(0, +)
    }
}

enum StringCalculatorError: Error, LocalizedError {
    case notNumber
    case nagativeNumber
    
    var errorDescription: String? {
        switch self {
        case .notNumber: return "숫자가 아님"
        case .nagativeNumber: return "음수 입력 에러"
        }
    }
}
