//
//  WinningRecord.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

typealias EqualNumberCount = Int

enum Rank: CaseIterable {
    case first, second, third, fourth, fifth, miss
    
    static func from(matchingCount: Int,  matchBonus: Bool) -> Self {
        switch matchingCount {
        case 3: return .fifth
        case 4: return .fourth
        case 5: return .third
        case 5 where matchBonus == true: return second
        case 6: return first
        default: return miss
        }
    }
    
    var prize: Int {
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

enum WinningCount: EqualNumberCount, CaseIterable {
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    
    var prize: Int {
        switch self {
        case .three: return 5_000
        case .four: return 50_000
        case .five: return 1_500_000
        case .six: return 2_000_000_000
        }
    }
}

struct WinningRecord: Equatable {
    typealias LottoCount =  Int
    
    private let hundred: Double = 100
    var value: [WinningCount: LottoCount] = [.three:0, .four: 0, .five: 0, .six: 0]
    
    init(equalNumberCounts: Array<Int>) {
        equalNumberCounts.compactMap { WinningCount(rawValue: $0) }
                        .forEach { value[$0]! += 1 }
    }
    
    func calculateProfitRate(inputMoney: Money) -> Double {
        
        let profit = value.reduce(0) { (partialResult: Int, value) in
            let (winningCount, lottoCount) = value
            return partialResult + winningCount.prize * lottoCount
        }
        
        return Double(profit) / Double(inputMoney.value) * hundred
    }
}
