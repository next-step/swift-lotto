//
//  CalculatorError.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

enum CalculatorError: Error {
    case unSupportedOperand
    case unSupportedNegativeNumber
    case unSupportedSeparator
    
    var message: String {
        switch self {
        case .unSupportedOperand:
            return "지원하지 않는 피연산자입니다.(숫자만 입력가능)."
        case .unSupportedNegativeNumber:
            return "음수는 지원하지 않습니다."
        case .unSupportedSeparator:
            return "해당 구분자는 지원하지 않습니다. (, 또는 :로 구분지어야 합니다)"
        }
    }
}
