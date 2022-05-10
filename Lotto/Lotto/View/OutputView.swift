//
//  OutputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct OutputView {
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
    
    static func print(error: Error) {
        Swift.print(error.localizedDescription)
    }
}
