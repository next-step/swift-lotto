//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    let seller = LottoSeller(purchaseAmount: LottoInputView.readPurchaseAmount(),
                             lottoMaker: LottoRandomNumberMaker())
    LottoResultView.printPurchasedLotto(seller.purchasedNumber())
    LottoResultView.printLottos(seller.sellLotto())
    let winningLotto = WinningLottoMaker(lastWeekWinningNumber:
                                            LottoInputView.readLastWeakWinningNumber(),
                                         bonusNumber:
                                            LottoInputView.readBonushNumber()).makeWinningLotto()
    let cener = LottoCenter(winningLotto: winningLotto)
    let user = User(userLotto: seller.sellLotto(), center: cener)
    let rankReport = RankReport(winning: user.winning())

    LottoResultView.printReport(rankReport.report())
    LottoResultView.printTotalYield(UserTotalYield.yield(winning: user.winning()))
}

main()
