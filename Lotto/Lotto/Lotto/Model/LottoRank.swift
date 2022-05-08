//
//  LottoRank.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

enum LottoRank: CaseIterable {
    case first
    case second
    case third
    case forth
    case fifth
    case none
    
    static func rank(matchNumberCount: Int,
                     isMatchBonus: Bool = false) -> LottoRank {
        switch matchNumberCount {
        case 6:
            return .first
        case 5:
            return .second
        case 4:
            return .third
        case 3:
            return .forth
        default:
            return .none
        }
    }
    
    var prizeMoney: Int {
        switch self {
        case .first:
            return 2000000000
        case .second:
            return 1500000
        case .third:
            return 50000
        case .forth:
            return 5000
        case .fifth:
            return 0
        case .none:
            return 0
        }
    }
}
