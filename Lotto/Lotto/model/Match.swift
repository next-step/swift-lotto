//
//  Match.swift
//  Lotto
//
//  Created by ycsong on 2022/05/12.
//

struct Match {
    enum Rank: CaseIterable {
        case first, second, third, fourth, fifth
        case miss
    }
    
    let rank: Rank
    var reward: Int {
        switch self.rank {
        case .first: return LottoReward.first.rawValue
        case .second: return LottoReward.second.rawValue
        case .third: return LottoReward.third.rawValue
        case .fourth: return LottoReward.fourth.rawValue
        case .fifth: return LottoReward.fifth.rawValue
        case .miss: return LottoReward.miss.rawValue
        }
    }
    
    init(matchingCount: Int,
         matchBonus: Bool = false) {
        switch matchingCount {
        case 6: self.rank = .first
        case 5 where matchBonus: self.rank = .second
        case 5: self.rank = .third
        case 4: self.rank = .fourth
        case 3: self.rank = .fifth
        default: self.rank = .miss
        }
    }
}
