//
//  LottoTicketMachine.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoTicketMachine {
    let lottoFactory: LottoFactory
    
    func issueTicket(havingLottoCount lottoCount: Int) throws -> LottoTicket {
        let lottoList = try (0..<lottoCount).map { _ in
            try lottoFactory.make()
        }
        return LottoTicket(lottoList: lottoList)
    }
}
