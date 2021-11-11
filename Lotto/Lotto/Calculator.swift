//
//  Calculator.swift
//  Lotto
//
//  Created by 조민호 on 2021/11/12.
//

import Foundation

enum StringOption {
    static let seperator = ",:"
}

struct Calculator {
    func split(input: String) -> [String] {
        input.components(separatedBy: CharacterSet(charactersIn: StringOption.seperator))
    }
}
