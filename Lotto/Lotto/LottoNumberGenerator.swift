//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

protocol LottoNumberGenerator {
    func generate() throws -> LottoNumber
}

struct RandomLottoNumberGenerator: LottoNumberGenerator {
    private let lottoNumberRange = LottoNumber.minValue...LottoNumber.maxValue
    
    func generate() throws -> LottoNumber {
        let randomNumber = Int.random(in: lottoNumberRange)
        
        guard let lottoNumber = LottoNumber(randomNumber) else {
            throw LottoNumber.Error.invalidValue
        }
        
        return lottoNumber
    }
}
