//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let inputView = InputView()

    let purchaseMoney: Int = try inputView.receivePurchaseMoney()
    let manualBuyCount: Int = try inputView.receiveManualBuyCount(inBudget: purchaseMoney)
    let purchasableCount = purchaseMoney / Lotto.Constants.price
    let automaticBuyCount: Int = purchasableCount - manualBuyCount

    let resultView = ResultView()
    resultView.printPurchaseCount(manual: manualBuyCount, automatic: automaticBuyCount)
    
    let manualLottos: [Lotto] = manualBuyCount > 0 ? try inputView.receiveManualLottos(for: manualBuyCount) : []
    let automaticLottos: [Lotto] = try buyAutomaticLottos(for: automaticBuyCount)
    let allLottos: [Lotto] = manualLottos + automaticLottos
    resultView.printLottos(for: allLottos)
    
    let winningLotto: Lotto = try inputView.receiveWinningLotto()
    let bonusNumber: LottoNumber = try inputView.receiveBonusNumber(in: winningLotto)
    
    let lottoResult: LottoResult = try lottoResult(lottos: allLottos,
                                                   winningLotto: winningLotto,
                                                   bonusNumber: bonusNumber)
    resultView.printWinningStatistics(with: lottoResult)
} catch {
    let errorView = ErrorView()
    errorView.printError(for: error)
}

private func buyAutomaticLottos(for purchaseCount: Int) throws -> [Lotto] {
    let lottoGenerator = LottoGenerator()
    let lottos: [Lotto] = try (1...purchaseCount)
        .map { _ in
            try lottoGenerator.generate()
        }
    return lottos
}

private func lottoResult(lottos: [Lotto],
                         winningLotto: Lotto,
                         bonusNumber: LottoNumber) throws -> LottoResult {
    
    let lottoRankChecker = try LottoRankChecker(winningLotto: winningLotto,
                                                bonusNumber: bonusNumber)
    let lottoResult = LottoResult(lottos: lottos,
                                  lottoRankChecker: lottoRankChecker)
    return lottoResult
}
