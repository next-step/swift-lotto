//
//  LottoSeller.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct LottoSeller: LottoSellable {
    private let purchaseAmount: String
    private let lottoMaker: LottoMakable
    
    init(purchaseAmount: String, lottoMaker: LottoMakable) {
        self.purchaseAmount = purchaseAmount
        self.lottoMaker = lottoMaker
    }
    
    func sellLotto() -> UserLotto {
        var result: [Lotto] = []
        
        for _ in 0..<purchasedNumber() {
            let lotto = Lotto(numbers: lottoMaker.make())
            result.append(lotto)
        }
        
        return UserLotto(purchasedLottos: result)
    }
    
    func purchasedNumber() -> Int {
        StringUtiltity.convertStringAmountToInt(to: purchaseAmount)
    }
}
