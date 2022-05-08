//
//  LottoResultView.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct LottoResultView {
    static func printPurchasedLotto(_ result: Int) {
        print("\(result)개를 구매했습니다.")
    }
    
    static func printLottos(_ userLotto: UserLotto) {
        userLotto.purchasedLottos.forEach { lotto in
            printLotto(lotto)
        }
        print()
    }
    
    private static func printLotto(_ lotto: Lotto) {
        var printResult: [Int] = []
        
        lotto.numbers.forEach { number in
            printResult.append(number.number)
        }
        
        print(printResult)
    }
    
    static func printReport(_ report: Report) {
        print()
        print("당첨 통계")
        print("---------")
        print("3개 일치 (5000원)- \(report.fifth)개")
        print("4개 일치 (50000원)- \(report.fourth)개")
        print("5개 일치 (1500000원)- \(report.third)개")
        print("6개 일치 (2000000000원)- \(report.first)개")
    }
    
    static func printTotalYield(_ totalYield: Double) {
        print("총 수익률은 \(totalYield.floorTwoDecimalPlaces)입니다.")
    }
}
