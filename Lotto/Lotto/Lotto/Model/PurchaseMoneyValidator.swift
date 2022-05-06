//
//  PurchaseMoneyValidator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct PurchaseMoneyValidator {
    
    enum PurchaseMoneyValidatorError: Error {
        case underMinimumMoney
        case notUnitOfLotto
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
