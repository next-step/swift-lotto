//
//  LottoRandomNumberMaker.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

protocol LottoMakable {
    func make() -> [LottoNumber]
}

struct LottoRandomNumberMaker: LottoMakable {
    func make() -> [LottoNumber] {
        let numbers = Array(1...45)
        var result: Set<Int> = []
        while result.count < 6 {
            result.insert(numbers.randomElement() ?? 1)
        }
        
        return result.map { LottoNumber(number: $0) }.sorted(by: >)
    }
}

struct LottoSameNumberMaker: LottoMakable {
    func make() -> [LottoNumber] {
        return [LottoNumber(number: 1), LottoNumber(number: 2), LottoNumber(number: 3),
                LottoNumber(number: 4), LottoNumber(number: 5), LottoNumber(number: 6)]
    }
}
