//
//  LottoTicket.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoTicket {
    let lottoList: [Lotto]
    
    func winningStatistics(with winningLotto: Lotto) -> WinningStatistics {
        var three = 0
        var four = 0
        var five = 0
        var six = 0
        
        let equalCounts = lottoList.map { lotto in
            lotto.equalNumberCount(with: winningLotto)
        }
    
        for count in equalCounts {
            switch count {
            case 3: three += 1
            case 4: four += 1
            case 5: five += 1
            case 6: six += 1
            default:
                continue
            }
        }
        
        return WinningStatistics(threeMatchingCount: three, fourMatchingCount: four, fiveMatchingCount: five, sixMatchingCount: six)
    }
}
