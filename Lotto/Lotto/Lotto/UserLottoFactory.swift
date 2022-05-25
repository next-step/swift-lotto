//
//  LottoFactory.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/15.
//

import Foundation

struct UserLottoFactory {
    let lottoNumberGenerator: LottoNumberGenerator
    
    func make() throws -> AutoLotto {
        var lottoNumbers = Set<Int>()
        
        repeat {
            let lottoNumber = try lottoNumberGenerator.generate()
            lottoNumbers.insert(lottoNumber)
        } while(lottoNumbers.count < LottoConstant.numberCount)
        
        return try! AutoLotto(numbers: lottoNumbers)
    }
}
