//
//  UniqueLottoNumbersValidatable.swift
//  Lotto
//
//  Created by Kang, Su Jin (강수진) on 2022/05/26.
//

import Foundation

protocol UniqueLottoNumbersValidatable {
    static func validateAllUniqueNumbers(of numbers: [LottoNumber]) throws
}

extension UniqueLottoNumbersValidatable {
    static func validateAllUniqueNumbers(of numbers: [LottoNumber]) throws {
        let isAllNumbersUnique = Set(numbers).count == numbers.count
        guard isAllNumbersUnique else {
            throw UniqueLottoNumbersError.hasDuplicate
        }
    }
}

enum UniqueLottoNumbersError: LocalizedError {
    case hasDuplicate
    
    var errorDescription: String? {
        switch self {
        case .hasDuplicate:
            return "중복되는 번호가 있습니다"
        }
    }
}
