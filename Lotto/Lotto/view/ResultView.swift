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
    
    static func printResult(of lottos: Lottos, winningLotto: WinnerLotto) {
        print("\n당첨 통계\n---------")
        
<<<<<<< HEAD
        print("3개 일치 (5,000원)- \(lottos.placeCount(of: .fifth, from: winningLotto))개")
        print("4개 일치 (50,000원)- \(lottos.placeCount(of: .fourth, from: winningLotto))개")
        print("5개 일치 (1,500,000원)- \(lottos.placeCount(of: .third, from: winningLotto))개")
        print("5개 일치, 보너스 번호 일치 (3,000,0000원)- \(lottos.placeCount(of: .second, from: winningLotto))개")
        print("6개 일치 (2,000,000,000원)- \(lottos.placeCount(of: .first, from: winningLotto))개")
        print("총 수익률은 \(String(format: "%.2f", lottos.profit(from: winningLotto)))입니다.")
=======
        let management = LottoManagement(from: lottos)
        let profit = management.calculateProfit()
        
        print("3개 일치 (5,000원)- \(management.fifthPlace)개")
        print("4개 일치 (50,000원)- \(management.fourthPlace)개")
        print("5개 일치 (1,500,000원)- \(management.thirdPlace)개")
        print("5개 일치, 보너스 번호 일치 (3,000,0000원)- \(management.secondPlace)개")
        print("6개 일치 (2,000,000,000원)- \(management.firstPlace)개")
        print("총 수익률은 \(profit)입니다.")
>>>>>>> yuchansong
    }
}
