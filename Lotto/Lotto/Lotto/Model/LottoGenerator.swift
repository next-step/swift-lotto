//
//  LottoGenerator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoGenerator {
    func generate() throws -> Lotto {
        var lottoNumbers: Set<Int> = []
        while (lottoNumbers.count < Lotto.Constants.numbersCount) {
            let randomLottoNumber = Int.random(in: Lotto.Constants.numberRange)
            lottoNumbers.insert(randomLottoNumber)
        }
        let lotto = try Lotto(numbers: Array(lottoNumbers))
        return lotto
    }
}
