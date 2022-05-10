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
        let equalNumberCounts = lottoList.map { lotto in
            lotto.equalNumberCount(with: winningLotto)
        }
    
        return WinningStatistics(equalNumberCounts: equalNumberCounts)
    }
    
    func lottoCount() -> Int { return 2 }
}
