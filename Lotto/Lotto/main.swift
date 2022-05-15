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
    let lottoSeller = LottoSeller(lottoFactory: lottoFactory)
    
    let lottoTicket = try lottoSeller.sellLotto(for: money)
    OutputView.print(lottoCount: lottoTicket.lottoCount)
    
    let formattedLottoTicket = LottoTicketFormatter.format(lottoTicket)
    OutputView.print(lottoTicket: formattedLottoTicket)
    
    let winningLottoInput = InputView.readWinningLotto()
    let winningLotto = try LottoParser.parse(winningLottoInput)
    
    let winningRecord = lottoTicket.winningRecord(with: winningLotto)
    let formattedRecord = WinningRecordFormatter.format(winningRecord)
    OutputView.print(winningRecord: formattedRecord)
} catch(let error) {
    OutputView.print(error: error)
}
