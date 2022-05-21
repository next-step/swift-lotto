//
//  PurchaseMoneyValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct PurchaseLottoValidator {
    
    enum PurchaseLottoValidatorError: LocalizedError {
        case underMinimumMoney
        case notUnitOfLotto
        case invalidPurchaseCount
        
        var errorDescription: String? {
            switch self {
            case .underMinimumMoney:
                return "로또를 구입하기 위해서는 1000원 이상이 필요합니다"
            case .notUnitOfLotto:
                return "금액이 로또 금액인 1000원 단위로 나뉘어지지 않습니다"
            case .invalidPurchaseCount:
                return "유효한 로또 구입 개수가 아닙니다"
            }
        }
    }

    
    static func validateMoney(_ money: Int) throws {
        let isEnoughMoneyToBuyLotto: Bool = money >= Lotto.Constants.price
        guard isEnoughMoneyToBuyLotto else {
            throw PurchaseLottoValidatorError.underMinimumMoney
        }
        
        let isUnitOfLotto: Bool = money % Lotto.Constants.price == 0
        guard isUnitOfLotto else {
            throw PurchaseLottoValidatorError.notUnitOfLotto
        }
    }
    
    static func validateCount(_ count: Int, inBudget money: Int) throws {
        let minPurchaseableCount = 0
        let maxPurchaseableCount = money / Lotto.Constants.price
        let purchasableCountRange = minPurchaseableCount...maxPurchaseableCount
        guard purchasableCountRange ~= count else {
            throw PurchaseLottoValidatorError.invalidPurchaseCount
        }
    }
}
