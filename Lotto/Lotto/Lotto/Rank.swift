//
//  Rank.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

enum Rank {
    case first, second, third, fourth, fifth, miss
    
    static func from(matchingCount: Int, matchBonus: Bool = false) -> Self {
        switch matchingCount {
        case 6: return .first
        case 5 where matchBonus: return .second
        case 5: return .third
        case 4: return .fourth
        case 3: return .fifth
        default: return .miss
        }
    }
    
    var reward: Int {
        switch self {
        case .first: return 2_000_000_000
        case .second: return 30_000_000
        case .third: return 1_500_000
        case .fourth: return 50_000
        case .fifth: return 5_000
        case .miss: return 0
        }
    }
}
