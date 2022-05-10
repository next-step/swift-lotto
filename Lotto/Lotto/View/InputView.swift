//
//  InputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct InputView {
    
    static func readMoney() -> String? {
        print("구입금액을 입력해 주세요.")
        return readLine()
    }
    
    static func readWinningLotto() -> String? {
        print("지난 주 당첨 번호를 입력해 주세요.")
        return readLine()
    }
}
