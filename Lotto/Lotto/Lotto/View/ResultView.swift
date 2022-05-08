//
//  ResultView.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct ResultView {

    private enum ResultText: UserInformable {
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
    
    func printPurchaseCount(with purchaseCount: Int) {
        userGuider.printGuide(for: ResultText.purchaseCount(value: purchaseCount))
    }
    
    func printLottos(for lottos: [Lotto]) {
        lottos.forEach { lotto in
            Swift.print(lotto.numbers.sorted())
        }
    }
    
    func printWinningStatistics(with lottoResult: LottoResult) {
        userGuider.printGuide(for: ResultText.winningStatisticsHeader)
        printCountForEachWinning(with: lottoResult)
        userGuider.printGuide(for: ResultText.earningsRate(value: lottoResult.earningsRate))
    }
    
    private func printCountForEachWinning(with lottoResult: LottoResult) {
        let matchCountForWinningRange: ClosedRange<Int> = (3...6)
        matchCountForWinningRange.forEach { matchCountForWinning in
            let lottoRank = LottoRank.rank(matchNumberCount: matchCountForWinning)
            userGuider.printGuide(for: ResultText.winning(matchCountForWinning: matchCountForWinning,
                                                          prizeMoneyForWinning: lottoRank.prizeMoney,
                                                          winningCount: lottoResult.winningCount(for: lottoRank)))
        }
    }
}
