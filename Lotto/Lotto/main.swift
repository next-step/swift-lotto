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
    let lottoFactory = UserLottoFactory(lottoNumberGenerator: lottoNumberGenerater)
    let lottoSeller = LottoSeller(lottoFactory: lottoFactory)
    
    let lottoBag = try lottoSeller.sellLotto(for: money)
    OutputView.print(lottoCount: lottoBag.lottoCount)
    
    let formattedLottoTicket = LottoTicketFormatter.format(lottoBag)
    OutputView.print(lottoTicket: formattedLottoTicket)
    
    let winningLottoInput = InputView.readWinningLotto()
    let bonusNumberInput = InputView.readBonusNumber()
    let winningLotto = try LottoParser.parseWinningLotto(lottoNumberInput: winningLottoInput, bonusNumberInput: bonusNumberInput)
    
    let winningRecord = lottoBag.winningRecord(with: winningLotto)
    let formattedRecord = WinningRecordFormatter.format(winningRecord)
    
    OutputView.print(winningRecord: formattedRecord)
    OutputView.print(profitRate: winningRecord.calculateProfitRate(inputMoney: money))
} catch(let error) {
    OutputView.print(error: error)
}
