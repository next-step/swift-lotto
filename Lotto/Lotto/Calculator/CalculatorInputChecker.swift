//
//  CalculatorInputChecker.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

struct CalculatorInputChecker {
    static func validateContainsNagativeNumbers(to splitedExpression: [Int]) throws {
        try splitedExpression.forEach { operand in
            guard operand > 0 else { throw CalculatorError.unSupportedNegativeNumber }
        }
    }
}
