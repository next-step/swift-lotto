//
//  LottoSellter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoSeller {
    enum Error: LocalizedError {
        case nonEnoughMoney
        
        var errorDescription: String? {
            switch self {
            case .nonEnoughMoney:
                return "로또를 사기에 투입된 금액이 부족합니다. 로또 한개의 금액은 \(LottoSeller.lottoPrice)입니다."
            }
        }
    }
    
    private static let lottoPrice = Money(value: 1000)!
    let lottoTicketMachine: LottoTicketMachine
    
    func sellLotto(for money: Money) throws -> LottoTicket {
        let lottoCount = try availableLottoCount(with: money)
        return try lottoTicketMachine.printTicket(havingLottoCount: lottoCount)
    }
    
    private func availableLottoCount(with money: Money) throws -> Int {
        if money < LottoSeller.lottoPrice  { throw Error.nonEnoughMoney }
        return money / LottoSeller.lottoPrice
    }
}
