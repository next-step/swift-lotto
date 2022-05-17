//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let purchaseCount = try InputView.readPurchasePrice()
    let manualCount = try InputView.readManualCount(purchaseCount: purchaseCount)
    let autoCount = purchaseCount - manualCount
    let manualLottos = try InputView.readManualNumbers(count: manualCount)

    let generator = LottoGenerator()
    let lottos = try generator.purchase(manualLottos: manualLottos, autoCount: autoCount)
    ResultView.printLottos(of: lottos)
    
    let winningNumbers = try InputView.readPrevWinningNumber()
    let bonusNumber = try InputView.readBonusNumber(winningNumbers: winningNumbers)
    let winningLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
    
    ResultView.printResult(of: lottos, winningLotto: winningLotto)
} catch let error as LottoError {
    print(error.errorDescription)
}
