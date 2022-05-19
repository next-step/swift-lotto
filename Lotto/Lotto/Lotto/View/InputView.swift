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
    
    func printBuyingLottosCount(_ count: Int) {
        LottoInputGuide.buyingLottoCount(count).show()
    }
    
    func printRecentlyWinningNumbers() {
        LottoInputGuide.winningNumbers.show()
    }
    
    func printRecentlyWinningBonusNumber() {
        LottoInputGuide.winningBonusNumber.show()
    }
}
