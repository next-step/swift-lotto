//
//  WinningRecord.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct WinningRecord {
    let threeMatchingCount: Int
    let fourMatchingCount: Int
    let fiveMatchingCount: Int
    let sixMatchingCount: Int
    
    func calculateTheProfitRate(inputMoney: Money) -> Double {
        let winningPrize = threeMatchingCount * 5000 + fourMatchingCount * 50000 + fiveMatchingCount * 1500000 + sixMatchingCount * 2000000000

        return Double(winningPrize) / Double(inputMoney.value) * 100
    }
}
