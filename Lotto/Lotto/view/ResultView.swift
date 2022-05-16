//
//  ResultView.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

struct ResultView {
    static func printPurchaseMessage(_ n: Int) {
        print("\n\(n)개를 구매했습니다.")
    }
    
    static func printLottoNumbers(of lotto: Lotto) {
        print(lotto)
    }
    
    static func printResult(of lottos: Lottos, winningNumbers: LottoNumbers) {
        print("\n당첨 통계\n---------")
        
//        let management = LottoManagement(from: lottos)
//        let profit = management.calculateProfit()
//
//        print("3개 일치 (5,000원)- \(lottos.place(with: .fifth, winningNumbers: winningNumbers))개")
//        print("4개 일치 (50,000원)- \(lottos.place(with: .fourth, winningNumbers: winningNumbers))개")
//        print("5개 일치 (1,500,000원)- \(lottos.place(with: .third, winningNumbers: winningNumbers))개")
//        print("5개 일치, 보너스 번호 일치 (3,000,0000원)- \(lottos.place(with: .second, winningNumbers: winningNumbers))개")
//        print("6개 일치 (2,000,000,000원)- \(lottos.place(with: .first, winningNumbers: winningNumbers))개")
//        print("총 수익률은 \(profit)입니다.")
    }
}
