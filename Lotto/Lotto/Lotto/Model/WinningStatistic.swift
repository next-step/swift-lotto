//
//  WinningStatistic.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

final class WinningStatistic {
    private var statistic: [Winning: Int] = [:]
    private var winningNumbers: [Int: Int] = [:]
    
    init() {
        statistic = initStatistic()
        winningNumbers = initWinningNumbers()
    }
    
    private func initWinningNumbers() -> [Int: Int] {
        var initWinningNumbers: [Int: Int] = [Int: Int]()
        for i in 1...45 {
            initWinningNumbers.updateValue(0, forKey: i)
        }
        return initWinningNumbers
    }
    
    private func initStatistic() -> [Winning: Int] {
        var initStatistic: [Winning: Int] = [Winning: Int]()
        for winning in Winning.allCases {
            initStatistic.updateValue(0, forKey: winning)
        }
        return initStatistic

    }
    
    func registerWinningNumbers(_ numbers: [Int]) {
        for number in numbers {
            winningNumbers[number]! += 1
        }
    }
    
    func insertStatistic(_ lotto: Lotto) {
        var count = 0
        for number in lotto.numbers {
            count += winningNumbers[number] ?? 0
        }
        if let winning = Winning.rank(count) {
            statistic[winning]! += 1
        }
        
    }
    
    func addWinningStatistic(rank: Winning) {
        statistic[rank]! += 1
    }
    
    func winningResultPrint() {
        for winning in Winning.allCases {
            let count = statistic[winning] ?? 0
            print("\(winning.description) \(winning.price)원 - \(count)개")
        }
    }
    
    func winningTotalPrice() -> Int {
        var money = 0
        for winning in Winning.allCases {
            let count = statistic[winning] ?? 0
            money += winning.price * count
        }
        return money
    }
}
