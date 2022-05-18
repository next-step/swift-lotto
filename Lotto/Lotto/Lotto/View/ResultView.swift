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
    
    func registerWinningNumbers(_ numbers: [Int]) {
        winningNumber.register(numbers)
    }
    
    func registerBonusNumber(_ bonusNumber: Int) {
        winningNumber.register(bonusNumber)
    }
    
    func printStatisticStart() {
        LottoGuide.statisticStart.show()
    }
    
    func printWinningTypeCount() {
        for winning in Winning.allCases {
            let count = statistic.statistic[winning] ?? 0
            LottoGuide.winningTypeRewardCount(type: winning, count: count).show()
        }
    }
    
    func match(my lottos: [Lotto]) {
        for lotto in lottos {
            let winning = winningNumber.match(lotto.numbers)
            statistic.insertStatistic(winning)
        }
    }
    
    func printLottoReward(than inputMoney: Int) {
        guard inputMoney >= 1000 else {
            LottoGuide.totalRewardRatio("0").show()
            return
        }
        let ratio = ratioString(numerator: statistic.appearWinningTotalPrice(), denominator: inputMoney)
        LottoGuide.totalRewardRatio(ratio).show()
    }
    
    private func ratioString(numerator: Int, denominator: Int) -> String {
        let ratio = Double(numerator) / Double(denominator)
        let toTwoDecimalPlaces = String(format: "%.2f", ratio)
        return toTwoDecimalPlaces
    }
}
