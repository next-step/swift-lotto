//
//  InputView.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct InputView {
    func inputMoney() -> String {
        LottoGuide.inputMoneyText.show()
        let money = readLine() ?? ""
        return money
    }
    
    func changeIntMoney(_ text: String) throws -> Int {
        if let intMoney = Int(text) {
            return intMoney
        }
        throw InputError.invalidMoney
    }
    
    func lotteryTotalCount(_ count: Int) {
        LottoGuide.totalLotteyCountText(count).show()
    }
    
    func winningNumbersInputTextPrint() {
        LottoGuide.winningNumbersInputText.show()
    }
}
