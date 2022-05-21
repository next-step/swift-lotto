//
//  LottoNumberValidator.swift
//  Lotto
//
//  Created by Kang, Su Jin (강수진) on 2022/05/21.
//

import Foundation

struct LottoNumberValidator {
    enum LottoNumberValidatorError: LocalizedError {
        case containOutOfRange
        
        var errorDescription: String? {
            switch self {
            case .containOutOfRange:
                return "1과 45 사이에 포함되지 않는 번호가 있습니다"
            }
        }
    }
    
    static func validate(of number: Int) throws {
        let isNumberInRange = Lotto.Constants.numberRange ~= number
        guard isNumberInRange else {
            throw LottoNumberValidatorError.containOutOfRange
        }
    }
}
