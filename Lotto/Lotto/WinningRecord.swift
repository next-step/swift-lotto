//
//  WinningRecord.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

typealias EqualNumberCount = Int

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
