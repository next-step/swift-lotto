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
    let lottoBagFactory: LottoBagFactory

    func sellLotto(for money: Money, with lottos: [Lotto] = []) throws -> LottoBag {
        if money < LottoSeller.lottoPrice  { throw Error.notEnoughMoney }
        
        let lottoCount = availableLottoCount(with: money)
        if lottoCount == 0 { throw Error.notEnoughMoney }
        if lottoCount < lottos.count  { throw Error.notEnoughMoney }
        
        let lottoBag = try lottoBagFactory.make(havingLottoCount: lottoCount, with: lottos)
        return lottoBag
    }
    
    private func availableLottoCount(with money: Money) -> Int {
        return money / LottoSeller.lottoPrice
    }
}
