//
//  OutputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct OutputView {
    static func print(_ lottoCount: Int) {
        print("\(lottoCount)개를 구매했습니다.")
    }
    static func print(_ lottoTicket: String) {
        print(lottoTicket)
    }
    
    static func print(_ winningStatsitics: String) {
        print("당첨 통계")
        print("---------")
        print(winningStatsitics)
    }
}
