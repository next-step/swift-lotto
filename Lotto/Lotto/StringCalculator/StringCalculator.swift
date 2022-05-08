//
//  StringCalculator.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/08.
//

import Foundation

struct StringCalculator {
    
    private let splitter = StringSplitter(validSeperators: [",", ":"])
    
    func calculate(with formula: String?) throws -> Int {
        guard let formula = formula, formula != "" else { return 0 }
        
        let numbers = seperate(formula: formula)
        
        try catchNegativeError(numbers: numbers)
        return numbers.reduce(0, +)
    }
    
    private func catchNegativeError(numbers: [Int]) throws {
        let filtered = numbers.filter { $0 < 0 }
        if !filtered.isEmpty { throw StringCalculatorError.negativeNumber }
    }
    
    private func seperate(formula: String) -> Array<Int> {
        let numbers = splitter.split(target: formula).compactMap( Int.init )
        return numbers
    }
}
