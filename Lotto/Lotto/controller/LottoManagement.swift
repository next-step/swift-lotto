//
//  CalculateProfit.swift
//  Lotto
//
//  Created by ycsong on 2022/05/07.
//

import Foundation

class LottoManagement {
    
    let fourth: Int
    let third: Int
    let second: Int
    let first: Int
    let rate: String
    
    init(from lottos: [Lotto]) {
        self.fourth = lottos.filter { $0.rank == .fourth }.count
        self.third = lottos.filter { $0.rank == .third }.count
        self.second = lottos.filter { $0.rank == .second }.count
        self.first = lottos.filter { $0.rank == .first }.count
        
        let amount: Double = Double (fourth * LottoReward.fourth.rawValue
                                        + third * LottoReward.third.rawValue
                                        + second * LottoReward.second.rawValue
                                        + first * LottoReward.first.rawValue)

        self.rate = String(format: "%.2lf",
                           amount / Double(Constants.lottoPrice * lottos.count))
    }
    
}
