//
//  WinningStatistic.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

final class WinningStatistic {
    private(set) var statistic: [Winning: Int] = [:]
    
    init() {
        statistic = initStatistic()
    }
    
    private func initStatistic() -> [Winning: Int] {
        var initStatistic: [Winning: Int] = [Winning: Int]()
        for winning in Winning.allCases {
            initStatistic.updateValue(0, forKey: winning)
        }
        return initStatistic

    }
    
    func insertStatistic(_ winning: Winning?) {
        if let winning = winning {
            statistic[winning]! += 1
        }
    }
    
    func appearWinningTotalPrice() -> Int {
        var money = 0
        for winning in Winning.allCases {
            let count = statistic[winning] ?? 0
            money += winning.reward * count
        }
        return money
    }
}
