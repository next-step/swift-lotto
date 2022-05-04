//
//  OperandValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct OperandValidator {
    
    func isValid(of operand: Int) -> Bool {
        return isPositiveInt(of: operand)
    }

    private func isPositiveInt(of input: Int) -> Bool {
        let isPositiveInt = input >= 0
        return isPositiveInt
    }
}
