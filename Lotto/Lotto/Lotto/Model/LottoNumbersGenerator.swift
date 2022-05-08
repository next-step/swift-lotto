//
//  LottoNumbersGenerator.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoNumbersGenerator {
    func generate() -> [Int] {
        var lottoNumbers: Set<Int> = []
        while (lottoNumbers.count < Lotto.Constants.numbersCount) {
            let randomLottoNumber = Int.random(in: Lotto.Constants.numberRange)
            lottoNumbers.insert(randomLottoNumber)
        }
        return Array(lottoNumbers)
    }
}
