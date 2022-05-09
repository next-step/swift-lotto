//
//  StringAdditionError.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

enum StringAdditionError: LocalizedError {
    case notNumber
    case negativeNumber
}

extension StringAdditionError {
    var errorDescription: String? {
        switch self {
        case .notNumber:
            return "숫자로 변환되지 않는 입력값입니다."
        case .negativeNumber:
            return "음수값이 포함되어있습니다."
        }
    }
}
