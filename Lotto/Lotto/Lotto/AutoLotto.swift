//
//  UserLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

class AutoLotto: Lotto {
    override init?<LottoNumbers>(numbers: LottoNumbers) where LottoNumbers : Collection, LottoNumbers.Element == Int {
        super.init(numbers: numbers)
        guard (try? validateRange(numbers: numbers)) != nil,
              (try? validateCount(numbers: numbers)) != nil else {
                  return nil
              }
    }
}
