//
//  LottoValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoValidator: UniqueLottoNumbersValidatable {
    
    enum LottoValidatorError: LocalizedError {
        case invalidNumberCount
        
        var errorDescription: String? {
            switch self {
            case .invalidNumberCount:
                return "로또 번호 개수가 6개가 아닙니다"
            }
        }
    }
    
    static func validate(of numbers: [LottoNumber]) throws {
        try validateNumberCount(of: numbers)
        try validateAllUniqueNumbers(of: numbers)
    }
    
    private static func validateNumberCount(of numbers: [LottoNumber]) throws {
        guard numbers.count == Lotto.Constants.numbersCount else {
            throw LottoValidatorError.invalidNumberCount
        }
    }
}
