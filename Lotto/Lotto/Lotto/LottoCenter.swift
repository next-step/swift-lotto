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
        let matchCountResult = matchCount(userLotto)
        return matchRank(matchCountResult: matchCountResult)
    }
    
    private func matchCount(_ userLotto: UserLotto) -> [Int] {
        var result: [Int] = []
        
        for lotto in userLotto.purchasedLottos {
            result.append(winningLotto.matchCount(numberToMatch: lotto))
        }
        
        return result
    }
    
    private func matchRank(matchCountResult: [Int]) -> [Rank] {
        var result: [Rank] = []
        
        for matchCount in matchCountResult {
            result.append(Rank.from(matchingCount: matchCount))
        }
        
        return result
    }
}
