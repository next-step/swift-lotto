//
//  LottoRule.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

struct LottoRule {
    let value: [LottoRuleElement]
    
    func check<LottoNumbers> (numbers: LottoNumbers) throws
    where LottoNumbers: Collection, LottoNumbers.Element == Int  {
        try value.forEach { rule in
            try rule.validate(numbers: numbers)
        }
    }
}


protocol LottoRuleElement {
    func validate<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int
}
