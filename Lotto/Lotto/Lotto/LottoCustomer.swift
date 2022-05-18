//
//  LottoCustomer.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/17.
//

import Foundation

class LottoCustomer {
    
    var lottos = [Lotto]()
    
    func buyLotto(for price: Int) {
        let lottoCount = price / 1000
        for _ in 0..<lottoCount {
            let lotto = Lotto()
            lottos.append(lotto)
        }
    }
}

