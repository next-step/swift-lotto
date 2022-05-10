//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let inputView = InputView()
    let purchaseMoney: Int = try inputView.recievePurchaseMoney()

    let resultView = ResultView()
    let purchaseCount = purchaseMoney / Lotto.Constants.price
    resultView.printPurchaseCount(with: purchaseCount)

    let lottos: [Lotto] = try buyLottos(for: purchaseCount)
    resultView.printLottos(for: lottos)
    
    let winningLotto: Lotto = try inputView.recieveWinningLotto()
    let bonusNumber: Int = try inputView.recieveBonusNumber(in: winningLotto)
    
    let lottoResult: LottoResult = try lottoResult(lottos: lottos,
                                                   winningLotto: winningLotto,
                                                   bonusNumber: bonusNumber)
    resultView.printWinningStatistics(with: lottoResult)
} catch {
    let errorView = ErrorView()
    errorView.printError(for: error)
}

private func buyLottos(for purchaseCount: Int) throws -> [Lotto] {
    let lottoGenerator = LottoGenerator()
    let lottos: [Lotto] = try (1...purchaseCount)
        .map { _ in
            try lottoGenerator.generate()
        }
    return lottos
}

private func lottoResult(lottos: [Lotto],
                         winningLotto: Lotto,
                         bonusNumber: Int) throws -> LottoResult {
    
    let lottoRankChecker = try LottoRankChecker(winningLotto: winningLotto,
                                                bonusNumber: bonusNumber)
    let lottoResult = LottoResult(lottos: lottos,
                                  lottoRankChecker: lottoRankChecker)
    return lottoResult
}
