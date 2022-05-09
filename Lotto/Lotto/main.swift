//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    let seller = LottoSeller(purchaseAmount: LottoInputView.readPurchaseAmount(),
                             lottoMaker: LottoRandomNumberMaker())
    let manualNumber = LottoInputView.readManualNumber()
    let manualUserLotto = LottoInputView.readManualLotto(manualNumber: manualNumber)
    let autoNumber = seller.purchasedNumber() - manualNumber
    LottoResultView.printPurchasedLotto(manualNumber: manualNumber,
                                        autoNumber: autoNumber)
    let userLotto = seller.sellLotto(manualNumber: manualNumber, manualUserLotto: manualUserLotto)
    LottoResultView.printLottos(userLotto)
    let winningLotto = WinningLottoMaker(lastWeekWinningNumber:
                                            LottoInputView.readLastWeakWinningNumber(),
                                         bonusNumber:
                                            LottoInputView.readBonushNumber()).makeWinningLotto()
    let center = LottoCenter(winningLotto: winningLotto)
    let user = User(userLotto: userLotto, center: center)
    let rankReport = RankReport(winning: user.winning())

    LottoResultView.printReport(rankReport.report())
    LottoResultView.printTotalYield(UserTotalYield.yield(winning: user.winning()))
}

main()
