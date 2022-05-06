//
//  LottoRank.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

enum LottoRank {
    case first
    case second
    case third
    case forth
    case none
    
    static func rank(matchNumberCount: Int) -> LottoRank {
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
}
