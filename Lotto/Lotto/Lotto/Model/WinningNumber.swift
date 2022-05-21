//
//  WinningNumber.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/16.
//

import Foundation

final class WinningNumber {
    private var winningNumbers: [Int: Int] = [:]
    private var bonusNumber: Int = 0

    init() {
        winningNumbers = initWinningNumbers()

    }
    private func initWinningNumbers() -> [Int: Int] {
        var initWinningNumbers: [Int: Int] = [Int: Int]()
        for i in 1...45 {
            initWinningNumbers.updateValue(0, forKey: i)
        }
        return initWinningNumbers
    }
    
    func register(_ winningNumbers: [Int]) {
        for number in winningNumbers {
            self.winningNumbers[number]! += 1
        }
    }
    
    func register(_ bonusNumber: Int) {
        self.bonusNumber = bonusNumber
    }
    
    func match(_ numbers: [Int]) -> Winning? {
        var count = 0
        let isBonusMatch = numbers.contains(bonusNumber)
        for number in numbers {
            count += self.winningNumbers[number] ?? 0
        }
        return Winning.rank(count,matchBonus: isBonusMatch)
    }
}

