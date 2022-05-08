//
//  ResultView.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct ResultView {

    private enum Result: UserInformable {
        case purchaseCount(value: Int)
        case winningStatisticsHeader
        case winning(matchCountForWinning: Int, prizeMoneyForWinning: Int, winningCount: Int)
        case earningsRate(value: Double)
        
        var guideDescription: String {
            switch self {
            case let .purchaseCount(purchaseCount):
                return "\(purchaseCount) 개를 구매했습니다."
            case .winningStatisticsHeader:
                return "당첨 통계\n------"
            case let .winning(matchCountForWinning, prizeMoneyForWinning, winningCount):
                return "\(matchCountForWinning)개 일치 (\(prizeMoneyForWinning)원)- \(winningCount)개"
            case let .earningsRate(earningsRate):
                let formattedEarningsRate = String(format: "%.2f", earningsRate)
                return "총 수익률은 \(formattedEarningsRate) 입니다."
            }
        }
    }
    
    private let userGuider = UserGuider()
    
    func drawPurchaseCount(with purchaseCount: Int) {
        userGuider.printGuide(for: Result.purchaseCount(value: purchaseCount))
    }
    
    func drawLottos(for lottos: [Lotto]) {
        lottos.forEach { lotto in
            Swift.print(lotto.numbers.sorted())
        }
    }
    
    func drawWinningStatistics(with lottoResult: LottoResult) {
        userGuider.printGuide(for: Result.winningStatisticsHeader)
        drawCountForEachWinning(with: lottoResult)
        userGuider.printGuide(for: Result.earningsRate(value: lottoResult.earningsRate))
    }
    
    private func drawCountForEachWinning(with lottoResult: LottoResult) {
        let matchCountForWinningRange: ClosedRange<Int> = (3...6)
        matchCountForWinningRange.forEach { matchCountForWinning in
            let lottoRank = LottoRank.rank(matchNumberCount: matchCountForWinning)
            userGuider.printGuide(for: Result.winning(matchCountForWinning: matchCountForWinning,
                                                 prizeMoneyForWinning: lottoRank.prizeMoney,
                                                 winningCount: lottoResult.winningCount(for: lottoRank)))
        }
    }
}
