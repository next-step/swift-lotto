//
//  LottoSellable.swift
//  Lotto
//
//  Created by 카카오VX on 2022/05/01.
//

protocol LottoSellable {
    func sellLotto() -> UserLotto
    func purchasedNumber() -> Int
}
