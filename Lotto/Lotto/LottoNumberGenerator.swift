//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

protocol LottoNumberGenerator {
    func generate() -> LottoNumber
}

struct NormalLottoNumberGenerator: LottoNumberGenerator {
    let range = LottoNumber.minValue...LottoNumber.maxValue
    
    func generate() -> LottoNumber {
        let lottoNumber = Int.random(in: range)
        return try! LottoNumber(value: lottoNumber)
    }
}
