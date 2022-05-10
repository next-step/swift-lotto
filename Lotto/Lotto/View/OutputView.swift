//
//  OutputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct OutputView {
    static func printMoneyError() {
        Swift.print("금액은 0이상의 양의 정수여야 합니다.")
    }
    
    static func print(lottoCount: Int) {
        Swift.print("\(lottoCount)개를 구매했습니다.")
    }
    static func print(lottoTicket: String) {
        Swift.print(lottoTicket)
    }
    
    static func print(winningStatsitics: String) {
        Swift.print("당첨 통계")
        Swift.print("---------")
        Swift.print(winningStatsitics)
    }
}
