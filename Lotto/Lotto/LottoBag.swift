//
//  LottoTicket.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoBag {
    let lottoList: [Lotto]

    func lottoCount<T: Lotto>(_ lottoType: T.Type) -> LottoCount {
        let count = lottoList.filter { type(of: $0) == lottoType }.count
        return LottoCount(count) ?? LottoCount.zero
    }
    
    func winningRecord(with winningLotto: WinningLotto) -> WinningRecord {
        let recordUnit = lottoList.map { lotto -> (Int, Bool) in
            let equalNumberCount = winningLotto.equalNumberCount(with: lotto)
            let matchBonus = winningLotto.checkBonusNumber(in: lotto)
            return (equalNumberCount, matchBonus)
        }
        
        return WinningRecord(recordUnits: recordUnit)
    }
}
