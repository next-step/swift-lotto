//
//  StringAdditionError.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation


enum StringAdditionError: Error {
    case notNumber
    case negativeNumber
    case unallowedDelimiters
}

extension StringAdditionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notNumber:
            return "숫자로 변환되지 않는 입력값입니다."
        case .negativeNumber:
            return "음수값이 포함되어있습니다."
        case .unallowedDelimiters:
            return "허용되지않는 구분자가 포함되어 있습니다."
        }
    }
}
