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
<<<<<<< HEAD
    
    let winningNumbers = try InputView.readPrevWinningNumber()
    let bonusNumber = try InputView.readBonusNumber(winningNumbers: winningNumbers)
    let winningLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
    
    ResultView.printResult(of: lottos, winningLotto: winningLotto)
=======

    let prev = try InputView.readPrevWinningNumber()
    let bonusNumber = try InputView.readBonusNumber(winningNumbers: prev)
    
    for lotto in lottos {
        lotto.match(from: prev, bonusNumber: bonusNumber)
    }

    ResultView.printResult(of: lottos)
>>>>>>> yuchansong
} catch let error as LottoError {
    print(error.errorDescription)
}
