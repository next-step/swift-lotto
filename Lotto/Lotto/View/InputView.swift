//
//  InputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

enum InputView {
    static func readMoney() -> String? {
        print("구입금액을 입력해 주세요.")
        return readLine()
    }
    
    static func readWinningLotto() -> String? {
        print("지난 주 당첨 번호를 입력해 주세요.")
        return readLine()
    }
    
    static func readCustomLottoCount() -> String? {
        print("수동으로 구매할 로또 수를 입력해 주세요.")
        return readLine()
    }
    
    static func readCustomLotto(of count: Int) -> String? {
        print("수동으로 구매할 번호를 입력해 주세요.")
        return readLine()
    }
    
    static func readBonusNumber() -> String? {
        print("보너스 번호를 입력해 주세요.")
        return readLine()
    }
}
