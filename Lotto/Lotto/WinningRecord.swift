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

struct WinningRecord: Equatable {
    typealias LottoCount =  Int
    typealias RecordUnit = (matchingCount: Int, matchBonus: Bool)
    
    private let hundred: Double = 100
    var value: [Rank: LottoCount] = [:]
    
    init(recordUnits: [RecordUnit]) {
        Rank.allCases.forEach { self.value[$0] = 0 }
        
        recordUnits.map{ matchingCount, matchBonus in
            Rank.from(matchingCount: matchingCount, matchBonus: matchBonus)
        }.forEach { value[$0]! += 1 }
    }
    
    func calculateProfitRate(inputMoney: Money) -> Double {
        let profit = value.reduce(0) { (partialResult: Int, value) in
            let (rank, lottoCount) = value
            return partialResult + rank.prize * lottoCount
        }
        
        return Double(profit) / Double(inputMoney.value) * hundred
    }
}
