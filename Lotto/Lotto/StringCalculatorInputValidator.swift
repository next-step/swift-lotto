//
//  StringCalculatorInputValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringCalculatorInputValidator {
    func isValid(of input: String?) -> Bool {
        guard let input = input else {
            return false
        }
        return true
    }
}
