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
    
    init?(purchaseAmount: String, lottoMaker: LottoMakable) throws {
        let saftyAmount = purchaseAmount.allSatisfy { $0.isNumber }
        guard saftyAmount else { throw LottoError.invalidAmount }
        guard StringUtiltity.convertStringAmountToInt(to: purchaseAmount) > 0 else { throw LottoError.lackOfAmount }
        self.purchaseAmount = purchaseAmount
        self.lottoMaker = lottoMaker
    }
    
    func sellLotto(manualNumber: Int, manualUserLotto: [String]) throws -> UserLotto {
        guard manualUserLotto.count == 6 else { throw LottoError.duplicateInput }
        
        var result: [Lotto] = []
        let autoNumber: Int = purchasedNumber()-manualNumber
        
        result += makeAutoLotto(autoNumber: autoNumber)
        result += try makeManualLotto(manualUserLotto: manualUserLotto)
        
        return UserLotto(purchasedLottos: result)
    }
    
    private func makeAutoLotto(autoNumber: Int) -> [Lotto] {
        var result: [Lotto] = []
        
        for _ in 0..<autoNumber {
            let lotto = Lotto(numbers: lottoMaker.make())
            result.append(lotto)
        }
        
        return result
    }
    
    private func makeManualLotto(manualUserLotto: [String]) throws -> [Lotto] {
        var result: [Lotto] = []
        
        try manualUserLotto.forEach { lotto in
            let lottoNumbers = try StringUtiltity.splitLottoNumbers(to: lotto).map { LottoNumber(number: $0) }
            result.append(Lotto(numbers: lottoNumbers))
        }
        
        return result
    }
    
    func purchasedNumber() -> Int {
        StringUtiltity.convertStringAmountToInt(to: purchaseAmount)
    }
}
