//
//  InputError.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/07.
//

import Foundation

enum InputError: Error {
    case invalidNumber
    case invalidMoney
    case invalidNumberCount
    case duplicateNumber
    case negativeNumber
    case lottoOutOfRange
    
    var errorDescription: String {
        switch self {
        case .invalidNumber:
            return "유효한 숫자가 아닙니다"
        case .invalidMoney:
            return "유효한 돈이 아닙니다"
        case .invalidNumberCount:
            return "번호가 6개가 아닙니다"
        case .duplicateNumber:
            return "번호에 중복이 포함되어 있습니다."
        case .negativeNumber:
            return "음수는 입력할 수 없습니다."
        case .lottoOutOfRange:
            return "로또 범위에 벗어났습니다"
        }
    }
}

extension InputError {
    func showError() {
        print(self.errorDescription)
    }
}
