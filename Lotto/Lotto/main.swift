//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let count = try InputView.readPurchasePrice()

    let generator = LottoGenerator()
    let lottos = try generator.auto(n: count)
    
    let winningNumbers = try InputView.readPrevWinningNumber()
    let bonusNumber = try InputView.readBonusNumber(winningNumbers: winningNumbers)
    let winningLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
    
    ResultView.printResult(of: lottos, winningLotto: winningLotto)
} catch let error as LottoError {
    print(error.errorDescription)
}
