//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let moneyInput = InputView.readMoney()
    let money = try MoneyParser.parse(money: moneyInput)
    
    let lottoNumberGenerater = RandomLottoNumberGenerator()
    let lottoFactory = LottoFactory(lottoNumberGenerator: lottoNumberGenerater)
    let lottoTicketMachine = LottoTicketMachine(lottoFactory: lottoFactory)
    let lottoSeller = LottoSeller(lottoTicketMachine: lottoTicketMachine)
    
    let lottoTicket = try lottoSeller.sellLotto(for: money)
    
} catch(let error) {
    
}



