//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

protocol LottoNumberGenerator {
    func generate() -> LottoNumber?
}

struct RandomLottoNumberGenerator: LottoNumberGenerator {
    private let lottoNumberRange = LottoNumber.minValue...LottoNumber.maxValue
    
    func generate() -> LottoNumber? {
        let lottoNumber = Int.random(in: lottoNumberRange)
        return LottoNumber(lottoNumber)
    }
}
