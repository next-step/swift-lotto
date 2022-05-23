//
//  InputView.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct InputView {
    func inputMoney() -> String {
        LottoInputGuide.money.show()
        let money = readLine() ?? ""
        return money
    }
    
    func printManualLottoInput() {
        LottoInputGuide.manualLottoInput.show()
    }
    
    func printManualLottoCountInput() {
        LottoInputGuide.manualLottoCountInput.show()
    }
    
    func printBuyingLottosCount(autoCount: Int, manualCount: Int) {
        LottoInputGuide.buyingLottoCount(manualCount,autoCount).show()
    }
    
    func printRecentlyWinningNumbers() {
        LottoInputGuide.winningNumbers.show()
    }
    
    func printRecentlyWinningBonusNumber() {
        LottoInputGuide.winningBonusNumber.show()
    }
}
