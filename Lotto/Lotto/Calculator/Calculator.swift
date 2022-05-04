//
//  Calculator.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/28.
//

import Foundation

struct Calculator {
    static func calculate(to inputExpression: String?) throws -> Int {
        guard let inputExpression = inputExpression else { return 0 }
        guard !inputExpression.isEmpty else { return 0 }
        let convertedExpression = StringUtiltity.convertSeparator(to: inputExpression)
        let splitedExpression = StringUtiltity.splitExpression(to: convertedExpression)
        let convertedOperand = try CalculatorInputChecker.validateContainsUnSupportedSeparator(to: splitedExpression)
        try CalculatorInputChecker.validateContainsNagativeNumbers(to: convertedOperand)
        
        return addOperand(target: convertedOperand)
    }
    
    static func addOperand(target splitedExpression: [Int]) -> Int {
        var result: Int = 0
        
        splitedExpression.forEach { operand in
            result += operand
        }
        
        return result
    }
}
