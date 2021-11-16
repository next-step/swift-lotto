//
//  StringCalculator.swift
//  Lotto
//
//  Created by sangsun on 2021/11/17.
//

import Foundation

class StringCalculator {

    /// 사용자로부터 입력받은 문자열을 가공한다
    func processingString(by inputs: String?) -> Int {
        guard let inputs = inputs, inputs.isEmpty == false else { return 0 }
        if let number = Int(inputs) {
            return number
        }
        return 0
    }
}
