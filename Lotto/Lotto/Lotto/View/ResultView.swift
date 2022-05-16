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
    
    func registerWinningNumbers(_ numbers: [Int]) throws {
        guard numbers.count == 6 else {
            throw InputError.invalidWinningNumberCount
        }
        guard Set(numbers).count == 6 else {
            throw InputError.duplicateWinningNumber
        }
        winningNumber.register(numbers)
    }
    
    func registerBonusNumber(_ bonusNumber: Int) throws {
        guard bonusNumber >= 1 , bonusNumber <= 45 else {
            throw InputError.invalidNumber
        }
        winningNumber.register(bonusNumber)
    }
    
    func statisticStartPrint() {
        LottoGuide.statisticStart.show()
    }
    
    func winningTypeCountPrint() {
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
    
    func lotteryRewardPrint(inputMoney: Int) {
        guard inputMoney >= 1000 else {
            LottoGuide.totalRewardRatio("0").show()
            return
        }
        let ratio = ratioString(numerator: statistic.winningTotalPrice(), denominator: inputMoney)
        LottoGuide.totalRewardRatio(ratio).show()
    }
    
    private func ratioString(numerator: Int, denominator: Int) -> String {
        let ratio = Double(numerator) / Double(denominator)
        let toTwoDecimalPlaces = String(format: "%.2f", ratio)
        return toTwoDecimalPlaces
    }
}
