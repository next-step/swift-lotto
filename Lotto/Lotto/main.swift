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
    let bonusNumberInput = InputView.readBonusNumber()
    let winningLotto = try LottoParser.parseWinningLotto(lottoNumberInput: winningLottoInput, bonusNumberInput: bonusNumberInput)
    
    let winningRecord = lottoTicket.winningRecord(with: winningLotto as Lotto as! WinningLotto)
    let formattedRecord = WinningRecordFormatter.format(winningRecord)
    OutputView.print(winningRecord: formattedRecord)
} catch(let error) {
    OutputView.print(error: error)
}
