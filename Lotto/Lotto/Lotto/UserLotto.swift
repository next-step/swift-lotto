//
//  UserLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

class UserLotto: Lotto {
    override init<LottoNumbers>(numbers: LottoNumbers) throws where LottoNumbers : Collection, LottoNumbers.Element == Int {
        try super.init(numbers: numbers)
        try validateRange(numbers: numbers)
        try validateCount(numbers: numbers)
    }
}
