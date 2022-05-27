//
//  Prize.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

enum Prize: Int {
    case first = 2_000_000_000
    case second = 30_000_000
    case third = 1_500_000
    case fourth = 50_000
    case fifth = 5_000
    case miss = 0
    
    static func getPrize(by matchNumber: Int, isBonus: Bool = false) -> Prize {
        switch matchNumber {
        case 6:
            return Prize.first
        case 5 where isBonus:
            return Prize.second
        case 5:
            return Prize.third
        case 4:
            return Prize.fourth
        case 3:
            return Prize.fifth
        default:
            return Prize.miss
        }
    }
}
