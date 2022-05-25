//
//  Prize.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

enum Prize: Int {
    case first = 2_000_000_000
    case second = 1_500_000
    case third = 50_000
    case fourth = 5_000
    case miss = 0
    
    static func getPrize(by matchNumber: Int) -> Prize {
        switch matchNumber {
        case 6:
            return Prize.first
        case 5:
            return Prize.second
        case 4:
            return Prize.third
        case 3:
            return Prize.fourth
        default:
            return Prize.miss
        }
    }
}
