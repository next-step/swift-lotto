//
//  OutputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct OutputView {
    static func print(lottoBag: String) {
        Swift.print(lottoBag)
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
        guard let localizedError = error as? LocalizedError else {
            Swift.print(error.localizedDescription)
            return
        }
        Swift.print(localizedError.errorDescription!)
    }
}
