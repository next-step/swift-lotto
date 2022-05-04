//
//  StringCalculator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringCalculator {
    
    private enum StringCalculatorError: Error {
        case invalidInput
    }
    
    private enum Separator: String, CaseIterable {
        case colon = ":"
        case comma = ","
    }
    
    private let operandFilter = OperandFilter()
    private let operandValidator = OperandValidator()
    
    func calculate(of input: String?) throws -> Int {
        guard let input = input else {
            throw StringCalculatorError.invalidInput
        }
        
        let operands = try operands(from: input)
        
        guard isAllOperandsValid(operands: operands) else {
            throw StringCalculatorError.invalidInput
        }
        
        return sum(of: operands)
    }
    
    private func operands(from input: String) throws -> [Int] {
        let separators: CharacterSet = {
            let joinedSeparators: String = Separator.allCases
                .map { separator in
                    separator.rawValue
                }
                .joined()
            return CharacterSet(charactersIn: joinedSeparators)
        }()
        let operands: [Int] = try operandFilter.filter(from: input,
                                                       separatedBy: separators)
        return operands
    }
    
    private func isAllOperandsValid(operands: [Int]) -> Bool {
        let isAllOperandsValid = operands.allSatisfy { operand in
            operandValidator.isValid(of: operand)
        }
        return isAllOperandsValid
    }
    
    private func sum(of operands: [Int]) -> Int {
        return operands.reduce(0, +)
    }
}
