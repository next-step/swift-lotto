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
        
        let numbers = formula.components(separatedBy: ",")
            .compactMap( Int.init )
        return numbers.reduce(0, +)
    }
}
