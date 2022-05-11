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
    
    var errorDescription: String {
        switch self {
        case .invalidNumber:
            return "유효한 숫자가 아닙니다"
        case .invalidMoney:
            return "유효한 돈이 아닙니다"
        }
    }
}

extension InputError {
    func showError() {
        print(self.errorDescription)
    }
}
