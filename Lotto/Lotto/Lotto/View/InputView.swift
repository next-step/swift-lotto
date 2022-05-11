//
//  InputView.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct InputView {
    private let inputMoneyText = "구매금액을 입력해 주세요."
    private let totalLotteyCountText = "개를 구매했습니다."
    private let winningNumbersInputText = "지난 주 당첨 번호를 입력해 주세요."

    
    func inputMoney() -> String {
        print(inputMoneyText)
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
        print("\(count)"+totalLotteyCountText)
    }
    
    func winningNumbersInputTextPrint() {
        print(winningNumbersInputText)
    }
}
