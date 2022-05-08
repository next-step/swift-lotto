//
//  StringCalculator.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/08.
//

import Foundation

struct StringCalculator {
    
    private let splitter = StringSplitter(validSeperators: [",", ":"])
    
    func calculate(with formula: String?) -> Int {
        guard let formula = formula, formula != "" else { return 0 }
        
        let numbers = seperate(formula: formula)
        return numbers.reduce(0, +)
    }
    
    private func seperate(formula: String) -> Array<Int> {
        let numbers = splitter.split(target: formula).compactMap( Int.init )
        return numbers
    }
}
