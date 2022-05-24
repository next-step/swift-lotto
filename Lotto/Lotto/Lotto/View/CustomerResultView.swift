//
//  CustomerResultView.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

struct CustomerResultView {
    
    func printLottos(for owner: LottoCustomer) {
        print("\(owner.lottos.count)개를 구매했습니다.")
        owner.lottos.forEach {
            printLottoDescription(for: $0)
        }
        print()
    }
    
    private func printLottoDescription(for lotto: Lotto) {
        let numbers = lotto.numbers.comparativeSet.sorted()
        print(numbers)
    }
    
    
}
