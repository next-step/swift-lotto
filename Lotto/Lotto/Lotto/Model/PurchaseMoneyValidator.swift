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
    
    private enum Constants {
        static let lottoPrice: Int = 1000
    }
    
    func validate(of money: Int) throws {
        let isEnoughMoneyToBuyLotto: Bool = money >= Constants.lottoPrice
        guard isEnoughMoneyToBuyLotto else {
            throw PurchaseMoneyValidatorError.underMinimumMoney
        }
        
        let isUnitOfLotto: Bool = money % Constants.lottoPrice == 0
        guard isUnitOfLotto else {
            throw PurchaseMoneyValidatorError.notUnitOfLotto
        }
    }
}
