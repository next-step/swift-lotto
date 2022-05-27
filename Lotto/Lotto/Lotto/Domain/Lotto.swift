//
//  Lotto.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

struct Lotto {
    var numbers: LottoNumbers
    
    var description: String {
        return "\(numbers.comparativeSet.sorted())"
    }
    
    func getPrize(with comparison: LottoNumbers, bonusNumber: LottoNumber) -> Prize {
        let matchNumber = numbers.match(with: comparison)
        return Prize.getPrize(by: matchNumber, isBonus: numbers.matchBonus(with: bonusNumber))
    }
}
