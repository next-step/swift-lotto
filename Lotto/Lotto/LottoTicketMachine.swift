//
//  LottoTicketMachine.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoTicketMachine {
    let lottoFactory: LottoFactory
    
    func printTicket(count: Int) -> LottoTicket {
        let lottoList = (0..<count).map { _ in
            lottoFactory.create()
        }
        return LottoTicket(lottoList: lottoList)
    }
}
