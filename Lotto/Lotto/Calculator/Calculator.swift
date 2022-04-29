//
//  Calculator.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/28.
//

import Foundation

struct Calculator {
    static func calculate(to inputExpression: String) throws -> Int {
        let convertedExpression = StringUtiltity.convertSeparator(to: inputExpression)
        let splitedExpression = StringUtiltity.splitExpression(to: convertedExpression)
        try CalculatorInputChecker.validateContainsNagativeNumbers(to: splitedExpression)
        
        return addOperand(target: splitedExpression)
    }
    
    static func addOperand(target splitedExpression: [Int]) -> Int {
        var result: Int = 0
        
        splitedExpression.forEach { operand in
            result += operand
        }
        
        return result
    }
}
