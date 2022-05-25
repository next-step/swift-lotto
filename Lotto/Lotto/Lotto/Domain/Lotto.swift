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
    
    func match(with comparedNumbers: LottoNumbers) -> Int {
        let lhs = numbers.comparativeSet
        let rhs = comparedNumbers.comparativeSet
        
        return lhs.intersection(rhs).count
    }
}
