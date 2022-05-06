//
//  LottoResult.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct LottoResult {
    
    private let lottos: [Lotto]
    private let lottoRankChecker: LottoRankChecker
    
    init(lottos: [Lotto],
         lottoRankChecker: LottoRankChecker) {
        self.lottos = lottos
        self.lottoRankChecker = lottoRankChecker
    }
    
    var earningsRate: Double {
        let buyLottoMoney: Int = lottos.count * Lotto.Constants.price
        let earningsMoney: Int = LottoRank.allCases.reduce(0) { partialResult, lottoRank -> Int in
            let prizeMoneyForWinningCount: Int = lottoRank.prizeMoney * winningCount(for: lottoRank)
            return partialResult + prizeMoneyForWinningCount
        }
        return Double(earningsMoney) / Double(buyLottoMoney)
    }
    
    func winningCount(for rank: LottoRank) -> Int {
        do {
            return try lottos.filter { lotto in
                try lottoRankChecker.rank(of: lotto.numbers) == rank
            }
            .count
        } catch {
            return 0
        }
    }
}
