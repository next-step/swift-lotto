//
//  Lotto.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

struct Lotto {
    var numbers = [Int]()
    
    static func generate(by lottoNumbers: LottoNumbers) -> Lotto {
        var lotto = Lotto()
        for _ in 0..<6 {
            lotto.numbers.append(lottoNumbers.pop())
        }
        return lotto
    }
}
