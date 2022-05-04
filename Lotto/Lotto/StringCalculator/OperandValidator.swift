//
//  OperandValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct OperandValidator {
    
    func isValid(of operand: Int) -> Bool {
        return !isNegativeInt(of: operand)
    }

    private func isNegativeInt(of input: Int) -> Bool {
        let isNegativeInt = input < 0
        return isNegativeInt
    }
}
