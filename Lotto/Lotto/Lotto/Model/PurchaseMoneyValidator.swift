//
//  PurchaseMoneyValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct PurchaseMoneyValidator {
    
    enum PurchaseMoneyValidatorError: LocalizedError {
        case underMinimumMoney
        case notUnitOfLotto
        
        var errorDescription: String? {
            switch self {
            case .underMinimumMoney:
                return "로또를 구입하기 위해서는 1000원 이상이 필요합니다"
            case .notUnitOfLotto:
                return "금액이 로또 금액인 1000원 단위로 나뉘어지지 않습니다"
            }
        }
    }
    
    func validate(of money: Int) throws {
        let isEnoughMoneyToBuyLotto: Bool = money >= Lotto.Constants.price
        guard isEnoughMoneyToBuyLotto else {
            throw PurchaseMoneyValidatorError.underMinimumMoney
        }
        
        let isUnitOfLotto: Bool = money % Lotto.Constants.price == 0
        guard isUnitOfLotto else {
            throw PurchaseMoneyValidatorError.notUnitOfLotto
        }
    }
}
