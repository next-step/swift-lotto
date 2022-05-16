//
//  LottoFactory.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/15.
//

import Foundation

struct LottoFactory {
    let lottoNumberGenerator: LottoNumberGenerator
    
    func make() throws -> DefaultLotto {
        var lottoNumbers = Set<Int>()
        
        repeat {
            let lottoNumber = try lottoNumberGenerator.generate()
            lottoNumbers.insert(lottoNumber)
        } while(lottoNumbers.count < LottoConstant.numberCount)
        
        return try! DefaultLotto(numbers: lottoNumbers)
    }
}
