//
//  OutputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct OutputView {

    static func print(lottoCount: Int) {
        Swift.print("\(lottoCount)개를 구매했습니다.")
    }
    static func print(lottoTicket: String) {
        Swift.print(lottoTicket)
    }
    
    static func print(winningRecord: String) {
        Swift.print("당첨 통계")
        Swift.print("---------")
        Swift.print(winningRecord)
    }
    
    static func print(profitRate: Double) {
        let profiteRateView = String(format: "총 수익률은 %.2f입니다.", profitRate)
        Swift.print(profiteRateView)
    }
    
    static func print(error: Error) {
        Swift.print(error.localizedDescription)
    }
}
