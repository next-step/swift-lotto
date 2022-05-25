//
//  CustomLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

class CustomLotto: Lotto {
    override init<LottoNumbers>(numbers: LottoNumbers) throws where LottoNumbers : Collection, LottoNumbers.Element == Int {
        try super.init(numbers: numbers)
        try validateCount(numbers: numbers)
        try validateRange(numbers: numbers)
    }
}
