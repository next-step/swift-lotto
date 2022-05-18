//
//  LottoGenerator.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct LottoGenerator {
    func generate(count: Int) -> [Lotto] {
        guard count > 0 else { return [] }
        var lottos: [Lotto] = []
        for _ in 1...count {
            lottos.append(Lotto())
        }
        return lottos
    }
    
    func changeMoneyToLottoCount(input money: Int) -> Int {
        if money < 0 {
            return 0
        }
        return money/1000
    }
}
