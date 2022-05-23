//
//  OutputView.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct ResultView {
    private let statistic = WinningStatistic()
    private let winningNumber = WinningNumber()
    
    func register(_ winningNumbers: [Int]) {
        winningNumber.register(winningNumbers)
    }
    
    func register(_ bonusNumber: Int) {
        winningNumber.register(bonusNumber)
    }
    
    func printStatisticStart() {
        LottoStatisticGuide.start.show()
    }
    
    func printWinningTypeCount() {
        for winning in Winning.allCases {
            let count = statistic.get()[winning] ?? 0
            LottoStatisticGuide.winningTypeRewardCount(type: winning, count: count).show()
        }
    }
    
    func match(my lottos: [Lotto]) {
        for lotto in lottos {
            let winning = winningNumber.match(lotto.getNumbers())
            statistic.insert(winning)
        }
    }
    
    func printLottoReward(than inputMoney: Int) {
        guard inputMoney >= 1000 else {
            LottoStatisticGuide.totalRewardRatio("0").show()
            return
        }
        let ratio = ratioString(numerator: statistic.appearWinningTotalPrice(), denominator: inputMoney)
        LottoStatisticGuide.totalRewardRatio(ratio).show()
    }
    
    private func ratioString(numerator: Int, denominator: Int) -> String {
        let ratio = Double(numerator) / Double(denominator)
        let toTwoDecimalPlaces = String(format: "%.2f", ratio)
        return toTwoDecimalPlaces
    }
}
