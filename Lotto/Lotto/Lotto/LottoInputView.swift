//
//  LottoInputView.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct LottoInputView {
    static func read(with description: String) -> String {
        print(description)
        let line = readLine() ?? ""
        return line
    }
    
    static func readPurchaseAmount() -> String {
        return read(with: "구매금액을 입력해 주세요.")
    }
    
    static func readLastWeakWinningNumber() -> String {
        return read(with: "지난 주 당첨 번호를 입력해 주세요.")
    }
}
