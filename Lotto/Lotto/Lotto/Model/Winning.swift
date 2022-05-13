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
    
    var reward: Int {
        switch self {
        case .first: return 20_0000_0000
        case .second: return 150_0000
        case .third: return 5_0000
        case .fourth: return 5000
        }
    }
    var description: String {
        switch self {
        case .first: return "6개 일치"
        case .second: return "5개 일치"
        case .third: return "4개 일치"
        case .fourth: return "3개 일치"
        }
    }
    
    static func rank(_ input: Int) -> Winning? {
        if input == 6 {
            return .first
        }
        if input == 5 {
            return .second
        }
        if input == 4 {
            return .third
        }
        if input == 3 {
            return .fourth
        }
        return nil
    }
}
