//
//  Lotto.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

struct Lotto {
    enum Prize: Int {
        case first = 2_000_000_000
        case second = 1_500_000
        case third = 50_000
        case fourth = 5_000
        case miss = 0
    }
    
    var numbers: LottoNumbers
    
    func match(with comparedNumbers: LottoNumbers) -> Int {
        let lhs = numbers.comparativeSet
        let rhs = comparedNumbers.comparativeSet
        
        return lhs.intersection(rhs).count
    }
    
    func getPrize(by matchNumber: Int) -> Int {
        switch matchNumber {
        case 6:
            return Prize.first.rawValue
        case 5:
            return Prize.second.rawValue
        case 4:
            return Prize.third.rawValue
        case 3:
            return Prize.fourth.rawValue
        default:
            return Prize.miss.rawValue
        }
    }
}
