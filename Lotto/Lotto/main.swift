//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    do {
        guard let seller = try LottoSeller(purchaseAmount: LottoInputView.readPurchaseAmount(),
                                       lottoMaker: LottoRandomNumberMaker()) else { return }
        let numberOfManualPurchased = LottoInputView.readNumberOfManualPurchase()
        let manualUserLotto = LottoInputView.readManualLotto(number: numberOfManualPurchased)
        let autoNumber = seller.purchasedNumber() - numberOfManualPurchased
        LottoResultView.printPurchasedLotto(manualNumber: numberOfManualPurchased,
                                            autoNumber: autoNumber)
        let userLotto = try seller.sellLotto(manualNumber: numberOfManualPurchased, manualUserLotto: manualUserLotto)
        LottoResultView.printLottos(userLotto)
        let winningLotto = try WinningLottoMaker(lastWeekWinningNumber:
                                                LottoInputView.readLastWeakWinningNumber(),
                                             bonusNumber:
                                                LottoInputView.readBonushNumber()).makeWinningLotto()
        let center = LottoCenter(winningLotto: winningLotto)
        let user = User(userLotto: userLotto, center: center)
        let rankReport = RankReport(winning: user.winning())

        LottoResultView.printReport(rankReport.report())
        LottoResultView.printTotalYield(UserTotalYield.yield(winning: user.winning()))
    }
    catch let error {
        guard let error = error as? LottoError else { return }
        LottoResultView.printError(error.message ?? "")
        main()
    }
}

main()
