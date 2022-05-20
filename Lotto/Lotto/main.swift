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
    
    guard let lottoCountInput = InputView.readCustomLottoCount(),
          let lottoCount = Int(lottoCountInput) else {
              exit(0)
          }
    let customLottoInput = InputView.readCustomLotto(of: lottoCount)
    let customLottos = try customLottoInput.map {
        try LottoParser.parseCustomLotto($0) }
    
    let lottoBag = try lottoSeller.sellLotto(for: money, with: customLottos)

    let formattedLottoBag = LottoBagFormatter.format(lottoBag)
    OutputView.print(lottoBag: formattedLottoBag)
    
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
