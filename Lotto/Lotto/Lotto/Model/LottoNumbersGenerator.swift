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
        while (lottoNumbers.count < LottoNumbersValidator.Constants.count) {
            let randomLottoNumber = Int.random(in: LottoNumbersValidator.Constants.range)
            lottoNumbers.insert(randomLottoNumber)
        }
        return Array(lottoNumbers)
    }
}
