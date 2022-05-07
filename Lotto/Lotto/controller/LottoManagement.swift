//
//  CalculateProfit.swift
//  Lotto
//
//  Created by ycsong on 2022/05/07.
//

import Foundation

class LottoManagement {
    
    let lottoCount: Int
    
    let fourthPlace: Int
    let thirdPlace: Int
    let secondPlace: Int
    let firstPlace: Int
    
    init(from lottos: [Lotto]) {
        self.lottoCount = lottos.count
        self.fourthPlace = lottos.filter { $0.rank == .fourth }.count
        self.thirdPlace = lottos.filter { $0.rank == .third }.count
        self.secondPlace = lottos.filter { $0.rank == .second }.count
        self.firstPlace = lottos.filter { $0.rank == .first }.count
    }
    
    func calculateProfit() -> String {
        let amount: Double = Double (fourthPlace * LottoReward.fourth.rawValue
                                        + thirdPlace * LottoReward.third.rawValue
                                        + secondPlace * LottoReward.second.rawValue
                                        + firstPlace * LottoReward.first.rawValue)

        return String(format: "%.2lf",
                      amount / Double(Constants.lottoPrice * lottoCount))
    }
    
}
