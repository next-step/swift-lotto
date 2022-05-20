//
//  LottoTicket.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoBag {
    let lottoList: [Lotto]
    
    var lottoCount: Int { return lottoList.count }
    func lottoCount<T: Lotto>(_ lottoType: T.Type) -> Int {
        return lottoList.filter { type(of: $0) == lottoType }.count
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
