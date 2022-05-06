//
//  CalculatorInputChecker.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

struct CalculatorInputChecker {
    static func validateContainsNagativeNumbers(to splitedExpression: [Int]) throws {
        try splitedExpression.forEach { operand in
            guard operand >= 0 else { throw CalculatorError.unSupportedNegativeNumber }
        }
    }
    
    static func validateContainsUnSupportedSeparator(to splitedExpression: [String]) throws {
        try splitedExpression.forEach { operand in
            guard Int(operand) != nil else { throw CalculatorError.unSupportedSeparator }
        }
    }
}
