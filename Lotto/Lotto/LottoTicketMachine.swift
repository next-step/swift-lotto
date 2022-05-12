//
//  LottoTicketMachine.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoTicketMachine {
    let lottoFactory: LottoFactory
    
    func printTicket(count: Int) throws -> LottoTicket {
        let lottoList = try (0..<count).map { _ in
            try lottoFactory.make()
        }
        return LottoTicket(lottoList: lottoList)
    }
}
