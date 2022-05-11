//
//  OutputView.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct ResultView {
    private let statistic = WinningStatistic()
    private let statisticText = "당첨 통계\n---------"
    
    func registerWinningNumbers(_ numbers: [Int]) {
        statistic.registerWinningNumbers(numbers)
    }
    
    func statisticStartPrint() {
        print(statisticText)
    }
    
    func winningTypeCountPrint() {
        statistic.winningResultPrint()
    }
    
    func match(_ lottos: [Lotto]) {
        for lotto in lottos {
            statistic.insertStatistic(lotto)
        }
    }
    
    func lotteryYieldPrint(inputMoney: Int) {
        guard inputMoney >= 1000 else {
            print("총 수익률은 없습니다")
            return
        }
        let ratio = ratioString(numerator: statistic.winningTotalPrice(), denominator: inputMoney)
        print("총 수익률은 \(ratio) 입니다")
    }
    
    private func ratioString(numerator: Int, denominator: Int) -> String {
        let ratio = Double(denominator) / Double(numerator)
        let toTwoDecimalPlaces = String(format: "%.2f", ratio)
        return toTwoDecimalPlaces
    }
}
