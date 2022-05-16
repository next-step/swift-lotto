//
//  LottoTicket.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoBag {
    let lottoList: [DefaultLotto]
    
    var lottoCount: Int { return lottoList.count }
    
    func winningRecord(with winningLotto: DefaultLotto) -> WinningRecord {
        let equalNumberCounts = lottoList.map { lotto in
            lotto.equalNumberCount(with: winningLotto)
        }
    
        return WinningRecord(equalNumberCounts: equalNumberCounts)
    }    
}
