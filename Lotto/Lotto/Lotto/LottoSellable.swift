//
//  LottoSellable.swift
//  Lotto
//
//  Created by 카카오VX on 2022/05/01.
//

protocol LottoSellable {
    func sellLotto(manualNumber: Int, manualUserLotto: [String]) throws -> UserLotto
    func purchasedNumber() -> Int
}
