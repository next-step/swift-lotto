//
//  LottoFactory.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/15.
//

import Foundation

struct LottoFactory {
    let lottoNumberGenerator: LottoNumberGenerator
    
    func make() throws -> Lotto {
        var lottoNumbers = Set<LottoNumber>()
        
        repeat {
            let lottoNumber = try lottoNumberGenerator.generate()
            lottoNumbers.insert(lottoNumber)
        } while(lottoNumbers.count < Lotto.numberCount)
        
        return try! Lotto(numbers: lottoNumbers)
    }
}
