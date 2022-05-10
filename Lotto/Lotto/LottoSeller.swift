//
//  LottoSellter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoSeller {
    let lottoMachine: LottoTicketMachine
    
    static func sellLotto(for money: Money) throws -> LottoTicket {
        let lotto = try! Lotto(numbers: [try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1)])
        return LottoTicket(lottoList: [lotto, lotto, lotto])
    }
}
