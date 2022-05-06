//
//  StringCalculator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringCalculator {
    
    private enum InputSeparator: String, CaseIterable {
        case colon = ":"
        case comma = ","
    }
    
    private let inputSplitter = Splitter(separators: InputSeparator.allCases.map { $0.rawValue } )
    private let validOperandMaker = ValidOperandMaker()
    
    func calculate(of input: String?) throws -> Int {
        guard let input = input,
              !input.isEmpty else {
                  return 0
              }
        
        let validOperands: [Int] = try validOperands(from: input)
        return sum(of: validOperands)
    }
   
    private func validOperands(from input: String) throws -> [Int] {
        let components: [String] = inputSplitter.components(of: input)
        return try components.map(validOperandMaker.operand)
    }
    
    private func sum(of operands: [Int]) -> Int {
        return operands.reduce(0, +)
    }
}
