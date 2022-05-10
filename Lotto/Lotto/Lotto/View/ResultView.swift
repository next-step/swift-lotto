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
        case winning(description: String)
        case earningsRate(value: Double)
        
        var guideDescription: String {
            switch self {
            case let .purchaseCount(purchaseCount):
                return "\(purchaseCount) 개를 구매했습니다."
            case .winningStatisticsHeader:
                return "당첨 통계\n------"
            case let .winning(description):
                return description
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
        LottoRank.allCases.map { lottoRank -> String in
            let matchNumberCount: Int = lottoRank.matchNumberCount
            let prizeMoney: Int = lottoRank.prizeMoney
            let winningRankCount: Int = lottoResult.winningCount(for: lottoRank)
            let bonusMatchDescription: String = lottoRank == .second ? ", 보너스 번호 일치" : ""
            return "\(matchNumberCount)개 일치\(bonusMatchDescription)(\(prizeMoney)원)- \(winningRankCount)개"
        }.forEach { description in
            userGuider.printGuide(for: ResultText.winning(description: description))
        }
    }
}
