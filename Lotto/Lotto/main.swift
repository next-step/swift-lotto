//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let moneyInput = InputView.readMoney()
    let money = try MoneyParser.parse(moneyInput)
    
    let lottoNumberGenerater = RandomLottoNumberGenerator()
    let lottoFactory = LottoFactory(lottoNumberGenerator: lottoNumberGenerater)
    let lottoTicketMachine = LottoTicketMachine(lottoFactory: lottoFactory)
    let lottoSeller = LottoSeller(lottoTicketMachine: lottoTicketMachine)
    
    let lottoTicket = try lottoSeller.sellLotto(for: money)
    OutputView.print(lottoCount: lottoTicket.lottoCount)
    
    let formattedLottoTicket = LottoTicketFormatter.format(lottoTicket)
    OutputView.print(lottoTicket: formattedLottoTicket)
    
    let winningLottoInput = InputView.readWinningLotto()
    let winningLotto = try LottoParser.parse(winningLottoInput)
    
    let statistics = lottoTicket.winningStatistics(with: winningLotto)
    let formattedStatistics = WinningStatisticsFormatter.format(statistics)
    OutputView.print(winningStatsitics: formattedStatistics)
} catch(let error) {
    OutputView.print(error: error)
}



