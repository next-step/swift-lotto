//
//  ResultView.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

struct ResultView {
    static func printResult(of lottos: [Lotto]) {
        print("\n당첨 통계\n---------")
        
        let management = LottoManagement(from: lottos)
        let profit = management.calculateProfit()
        
        print("3개 일치 (5,000원)- \(management.fourthPlace)개")
        print("4개 일치 (50,000원)- \(management.thirdPlace)개")
        print("5개 일치 (1,500,000원)- \(management.secondPlace)개")
        print("6개 일치 (2,000,000,000원)- \(management.firstPlace)개")
        print("총 수익률은 \(profit)입니다.")
    }
}
