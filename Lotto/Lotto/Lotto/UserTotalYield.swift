//
//  UserTotalYield.swift
//  Lotto
//
//  Created by 카카오VX on 2022/05/01.
//

import Foundation

struct UserTotalYield {
    static func yield(winning: [Rank]) -> Double {
        var amount: Int = 0
        
        for rank in winning {
            amount += rank.reward
        }
        
        return amount == 0 ? 0 : Double(amount) / Double((winning.count * 1000))
    }
}
