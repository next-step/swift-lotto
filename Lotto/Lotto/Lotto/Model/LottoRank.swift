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
        case 5 where isMatchBonus:
            return .second
        case 5:
            return .third
        case 4:
            return .forth
        case 3:
            return .fifth
        default:
            return .none
        }
    }
    
    var matchNumberCount: Int {
        switch self {
        case .first:
            return 6
        case .second:
            return 5
        case .third:
            return 5
        case .forth:
            return 4
        case .fifth:
            return 3
        default:
            return 0
        }
    }
    
    var prizeMoney: Int {
        switch self {
        case .first:
            return 2_000_000_000
        case .second:
            return 30_000_000
        case .third:
            return 1_500_000
        case .forth:
            return 50_000
        case .fifth:
            return 5_000
        case .none:
            return 0
        }
    }
}
