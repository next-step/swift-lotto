//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

protocol LottoNumberGenerator {
    func generate() throws -> Int
}

struct RandomLottoNumberGenerator: LottoNumberGenerator {
    private var lottoNumberRange: ClosedRange<Int> { return LottoConstant.minValue...LottoConstant.maxValue }
    
    func generate() throws -> Int {
        let randomNumber = Int.random(in: lottoNumberRange)
        return randomNumber
    }
}
