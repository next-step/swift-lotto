//
//  Winning.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation
enum Winning: CaseIterable {
    case first
    case second
    case third
    case fourth
    case fifth
    
    var reward: Int {
        switch self {
        case .first: return 20_0000_0000
        case .second: return 3000_0000
        case .third: return 150_0000
        case .fourth: return 5_0000
        case .fifth: return 5000
        }
    }
    var description: String {
        switch self {
        case .first: return "6개 일치"
        case .second: return "5개 일치 + 보너스 일치"
        case .third: return "5개 일치"
        case .fourth: return "4개 일치"
        case .fifth: return "3개 일치"
        }
    }
    
    static func rank(_ matchCount: Int, matchcBonus: Bool = false) -> Winning? {
        if matchCount == 6 {
            return .first
        }
        if matchCount == 5, matchcBonus {
            return .second
        }
        if matchCount == 5 {
            return .third
        }
        if matchCount == 4 {
            return .fourth
        }
        if matchCount == 3 {
            return .fifth
        }
        return nil
    }
}
