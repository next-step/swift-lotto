//
//  LottoNumberGenerator.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/15.
//

import Foundation

class StubLottoNumberGenerator: LottoNumberGenerator {
    var lottoNumber = 0

    func generate() throws -> Int {
        lottoNumber += 1
        return lottoNumber
    }
}
