//
//  StringCalculator.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/08.
//

import Foundation

struct StringCalculator {
    
    func calculate(with formula: String?) -> Int {
        guard let formula = formula, formula != "" else { return 0 }
        
        let numbers = seperate(formula: formula)
        return numbers.reduce(0, +)
    }
    
    private func seperate(formula: String) -> Array<Int> {
        let validSeperator = [",", ":"]
        let seperator = CharacterSet(charactersIn: validSeperator.joined())
        let seperated = formula.components(separatedBy: seperator)
        
        let numbers = seperated.compactMap( Int.init )
        
        return numbers
    }
}
