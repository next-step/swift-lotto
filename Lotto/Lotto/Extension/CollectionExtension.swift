//
//  Collection.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/17.
//

import Foundation

extension Collection where Element == Int {
    func canBeLottoNumbers() -> Bool {
        return self.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
    }
}
