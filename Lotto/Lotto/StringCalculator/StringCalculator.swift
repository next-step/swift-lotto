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
        let seperated = splitter.split(target: formula)
        try catchCalculatorError(at: seperated)
        
        return seperated.compactMap({ Int($0) }).reduce(0, +)
    }
    
    private func catchCalculatorError(at separatedFormula: [String]) throws {
        let o = separatedFormula.map { Int($0) }
        if o.contains(nil) { throw StringCalculatorError.invalidFormula }
        if o.compactMap({ $0 }).contains(where: { $0 < 0 }) { throw StringCalculatorError.negativeNumber }
    }
}
