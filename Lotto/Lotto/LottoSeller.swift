//
//  LottoSellter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoSeller {
    enum Error: LocalizedError {
        case notEnoughMoney
        
        var errorDescription: String? {
            switch self {
            case .notEnoughMoney:
                return "로또를 사기에 투입된 금액이 부족합니다. 로또 한개의 금액은 \(LottoSeller.lottoPrice)입니다."
            }
        }
    }
    
    private static let lottoPrice = Money(value: 1000)!
    let lottoFactory: UserLottoFactory
    
    func sellLotto(for money: Money, with lottos: [Lotto] = []) throws -> LottoBag {
        if money.value <= 0 { throw Error.notEnoughMoney }
        let moneyValue = money.value - lottos.count * LottoSeller.lottoPrice.value
        if moneyValue < 0 { throw Error.notEnoughMoney }
        let money = Money(value: moneyValue)!
        // money == 0 lottos가 존재
        if money.value == 0 && lottos.isEmpty == false {
            return LottoBag(lottoList: lottos)
        }
        let lottoCount = try availableLottoCount(with: money)
        let lottoList = try (0..<lottoCount).map { _ in
            try lottoFactory.make()
        }
        return LottoBag(lottoList: lottoList + lottos)
    }
    
    private func availableLottoCount(with money: Money) throws -> Int {
        if money < LottoSeller.lottoPrice  { throw Error.notEnoughMoney }
        return money / LottoSeller.lottoPrice
    }
}
