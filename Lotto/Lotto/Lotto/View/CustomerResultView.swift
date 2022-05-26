//
//  CustomerResultView.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

struct CustomerResultView {
    
    func printLottos(of customer: LottoCustomer) {
        print("\(customer.lottos.count)개를 구매했습니다.")
        customer.lottos.forEach {
            printLottoDescription(for: $0)
        }
        print()
    }
    
    func printStatistics(of customer: LottoCustomer) {
        print("당첨 통계")
        print("---------")
        for matchNumber in 3...6 {
            print("\(matchNumber)개 일치 (\(Prize.getPrize(by: matchNumber).rawValue)원)- \(0)개")
        }
        print("총 수익율은 \(customer.getRatio(of: 14000))입니다.")
    }
    
    private func printLottoDescription(for lotto: Lotto) {
        let numbers = lotto.description
        print(numbers)
    }
    
    
}
