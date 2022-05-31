//
//  LottoConsumer.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/17.
//

import Foundation

class LottoConsumer {
    
    var lottos = [Lotto]()
    private(set) var price: Int = 0
    
    private(set) var autoCount: Int = 0
    private(set) var manualCount: Int = 0
    
    func buyLotto(for price: Int, manualLottos: [Lotto] = []) throws {
        guard price >= 1000 else { throw LottoError.insufficientMoney }
        let randomLottoCount = price / 1000 - manualLottos.count
        guard randomLottoCount >= 0 else { throw LottoError.tooManyManualLottos }
        self.price = price
        
        self.autoCount = randomLottoCount
        self.manualCount = manualLottos.count
        
        lottos += manualLottos
        for _ in 0..<randomLottoCount {
            let lotto = Lotto(numbers: try LottoNumbers.generateByRandom())
            lottos.append(lotto)
        }
    }
    
    func checkLottoPrizes(with prizeNumbers: LottoNumbers, bonusNumber: LottoNumber) -> [Prize] {
        return lottos.compactMap({ $0.getPrize(with: prizeNumbers, bonusNumber: bonusNumber) })
    }
    
    func getRatio(of returnPrize: Int) -> Double {
        let rawRatio = Double(returnPrize) / Double(self.price)
        let roundedRatio = round(rawRatio * 100) / 100.0
        return roundedRatio
    }
}

