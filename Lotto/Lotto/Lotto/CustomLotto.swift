//
//  CustomLotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

class CustomLotto: Lotto {
    override init?<LottoNumbers>(numbers: LottoNumbers) where LottoNumbers : Collection, LottoNumbers.Element == Int {
        super.init(numbers: numbers)
        guard (try? validateCount(numbers: numbers)) != nil,
              (try? validateRange(numbers: numbers)) != nil else {
                  return nil
              }
    }
}
