//
//  Calculator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol Calculatable {
    func calculate(operands: [Int], operators: [Operator]) -> Int
}


struct Calculator: Calculatable {
    
    func calculate(operands: [Int], operators: [Operator]) -> Int {
        var result = operands[0]
        
        operators.enumerated()
            .forEach { index, _operator in
                result = _operator.operate(result, operands[index + 1])
            }
        
        return result
    }
}

