//
//  LottoCustomer.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/17.
//

import Foundation

class LottoCustomer {
    
    var lottos = [Lotto]()
    private(set) var price = 0
    
    func buyLotto(for price: Int) {
        self.price = price
        let lottoCount = price / 1000
        for _ in 0..<lottoCount {
            let lotto = Lotto(numbers: LottoNumbers.generateByRandom())
            lottos.append(lotto)
        }
    }
    
    func checkLottoPrizes(with prizeNumbers: LottoNumbers) -> [Prize] {
        return lottos.compactMap({ $0.getPrize(with: prizeNumbers) })
    }
    
    func getRatio(of returnPrize: Int) -> Double {
        let rawRatio = Double(returnPrize) / Double(self.price)
        let roundedRatio = round(rawRatio * 100) / 100.0
        return roundedRatio
    }
}

