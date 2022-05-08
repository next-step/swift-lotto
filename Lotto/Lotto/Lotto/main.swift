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

    let lottos: [Lotto] = buyLottos(for: purchaseCount)
    resultView.printLottos(for: lottos)
    
    let winningNumbers: [Int] = try inputView.recieveWinningNumbers()
    let bonusNumber: Int = try inputView.recieveBonusNumber(in: winningNumbers)
    
    let lottoResult: LottoResult = try lottoResult(lottos: lottos, winningNumbers: winningNumbers)
    resultView.printWinningStatistics(with: lottoResult)
} catch let error as UserInformable {
    let errorView = ErrorView()
    errorView.guideInputError(error: error)
}

private func buyLottos(for purchaseCount: Int) -> [Lotto] {
    let lottoNumbersGenerator = LottoNumbersGenerator()
    let lottos: [Lotto] = (1...purchaseCount).map { _ in
        let lottoNumbers = lottoNumbersGenerator.generate()
        return Lotto(numbers: lottoNumbers)
    }
    return lottos
}

private func lottoResult(lottos: [Lotto],
                         winningNumbers: [Int]) throws -> LottoResult {
    
    let lottoRankChecker = try LottoRankChecker(winningNumbers: winningNumbers)
    let lottoResult = LottoResult(lottos: lottos,
                                  lottoRankChecker: lottoRankChecker)
    return lottoResult
}
