//
//  WinnerLotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/19.
//

struct WinnerLotto {
    let numbers: LottoNumbers
    let bonusNumber: LottoNumber
    
    init(_ lotto: LottoNumbers, bonus: LottoNumber) throws {
        if lotto.contains(bonus) {
            throw LottoError.duplicateNumber
        }
        self.bonusNumber = bonus
        self.numbers = lotto
    }
}
