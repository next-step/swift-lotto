//
//  WinningRecord.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

typealias EqualNumberCount = Int

enum WinningPrize: EqualNumberCount {
    case forThree = 3
    case forFour = 4
    case forFive = 5
    case forSix = 6
    
    var value: Int {
        switch self {
        case .forThree: return 5_000
        case .forFour: return 50_000
        case .forFive: return 1_500_000
        case .forSix: return 2_000_000_000
        }
    }
}

struct WinningStatistics {
    typealias LottoCount =  Int
    
    private let hundred: Double = 100
    
    var value: [WinningPrize: LottoCount] = [.forThree:0, .forFour: 0, .forFive: 0, .forSix: 0]
    
    init(equalNumberCounts: Array<Int>) {
        equalNumberCounts.compactMap { WinningPrize(rawValue: $0) }
        .forEach { value[$0]! += 1 }
    }
    
    func calculateProfitRate(inputMoney: Money) -> Double {
        var profit = 0
        
        for (winningPrize, count) in value {
            profit += (winningPrize.value * count)
        }
        
        return Double(profit) / Double(inputMoney.value) * hundred
    }
}
