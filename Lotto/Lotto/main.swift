//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let count = try InputView.readPurchasePrice()

    let generator = LottoGenerator()
    let lottos = generator.auto(n: count)

    let prev = try InputView.readPrevWinningNumber()
    
    for lotto in lottos {
        lotto.match(from: prev)
    }

    ResultView.printResult(of: lottos)
} catch let error as LottoError {
    print(error.errorDescription)
}
