//
//  Validator.swift
//  Lotto
//
//  Created by YooBin Jo on 2022/05/07.
//

import Foundation

final class Validator {
    
    static func check(_ number: String) throws -> Bool {
        guard let num = Int(number) else {
            throw ValidatorError.invalidNumber
        }
        if num > 0 {
            return true
        }
        throw ValidatorError.negativeNumber
    }
    
    enum ValidatorError: Error, LocalizedError {
        case negativeNumber
        case invalidNumber
        var errorDescription: String? {
            switch self {
            case .negativeNumber:
                return "음수는 허용되지 않은 수 입니다."
            case .invalidNumber:
                return "양의 정수 및 0만 입력할 수 있습니다."
            }
        }
    }
}
