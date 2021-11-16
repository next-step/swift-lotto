//
//  StringCalculator.swift
//  Lotto
//
//  Created by sangsun on 2021/11/17.
//

import Foundation

enum StringCalculatorError: Error {
    case negativeInputs
}

class StringCalculator {

    /// 사용자로부터 입력받은 문자열을 계산한다
    func calculateInputs(_ inputs: String?) throws -> Int {
        guard let inputs = inputs, inputs.isEmpty == false else { return 0 }
        
        let numbers = try processingInputs(by: inputs)
        let sum = numbers.reduce(0) { $0 + $1 }
        return sum
    }
    
    /// 사용자로부터 입력받은 문자열을 Int형 배열로 리턴한다
    func processingInputs(by inputs: String) throws -> [Int] {
        let numbers = inputs.components(separatedBy: [",", ":"]).compactMap { Int($0) }
        try numbers.forEach {
            if $0 < 0 {
                throw StringCalculatorError.negativeInputs
            }
        }
        return numbers
    }
}
