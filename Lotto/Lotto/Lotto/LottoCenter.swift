//
//  LottoCenter.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

protocol LottoCenterPort {
    func match(userLotto: UserLotto) -> [Rank]
}

struct LottoCenter: LottoCenterPort {
    private let winningLotto: WinningLotto
    
    init(winningLotto: WinningLotto) {
        self.winningLotto = winningLotto
    }
    
    func match(userLotto: UserLotto) -> [Rank] {
        let lotteryReports = matchLotteryReport(userLotto)
        return matchRank(lotteryReports: lotteryReports)
    }
    
    private func matchLotteryReport(_ userLotto: UserLotto) -> [LotteryReport] {
        var lotteryReports: [LotteryReport] = []
        
        for lotto in userLotto.purchasedLottos {
            let matchCount = winningLotto.matchCount(numberToMatch: lotto)
            let isMatch = winningLotto.isMatchBunusNumber(numberToMatch: lotto)
            let lotteryReport = LotteryReport(matchCount: matchCount, isMatch: isMatch)
            lotteryReports.append(lotteryReport)
        }
        
        return lotteryReports
    }
    
    
    
    private func matchRank(lotteryReports: [LotteryReport]) -> [Rank] {
        var result: [Rank] = []
        
        for lotteryReport in lotteryReports {
            result.append(Rank.from(matchingCount: lotteryReport.matchCount,
                                    matchBonus: lotteryReport.isMatch))
        }
        
        return result
    }
}
