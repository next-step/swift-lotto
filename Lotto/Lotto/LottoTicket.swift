//
//  LottoTicket.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoTicket {
    let lottoList: [Lotto]
    
    var lottoCount: Int { return lottoList.count }
    
    func winningRecord(with winningLotto: Lotto) -> WinningRecord {
        let equalNumberCounts = lottoList.map { lotto in
            lotto.equalNumberCount(with: winningLotto)
        }
    
        return WinningRecord(equalNumberCounts: equalNumberCounts)
    }    
}
