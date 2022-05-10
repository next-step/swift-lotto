//
//  LottoSellter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoSeller {
    private static let lottoPrice = Money(value: 1000)!
    let lottoTicketMachine: LottoTicketMachine
    
    func sellLotto(for money: Money) throws -> LottoTicket {
        let lottoCount = money / LottoSeller.lottoPrice
        return lottoTicketMachine.printTicket(count: lottoCount)
    }
}
