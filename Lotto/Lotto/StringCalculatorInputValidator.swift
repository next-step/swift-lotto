//
//  StringCalculatorInputValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringCalculatorInputValidator {
    
    private let stringCalculatorInputSplitter = StringCalculatorInputSplitter()
    
    func isValid(of input: String?) -> Bool {
        guard let input = input else {
            return false
        }
        let inputComponents: [String] = stringCalculatorInputSplitter.split(input)
        let isValidInput: Bool = inputComponents.allSatisfy { inputComponent in
            isPositiveInt(of: inputComponent)
        }
        return isValidInput
    }

    private func isPositiveInt(of input: String) -> Bool {
        guard let inputInt = Int(input) else {
            return false
        }
        let isPositiveInt = inputInt >= 0
        return isPositiveInt
    }
}
