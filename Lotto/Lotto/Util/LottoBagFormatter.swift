//
//  LottoTicketFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoBagFormatter {
    private static let lottoNumberSeparator = ","
    
    static func format(_ lottoTicket: LottoBag) -> String {
        let customLottoCount = lottoTicket.lottoCount(CustomLotto.self)
        let autoLottoCount = lottoTicket.lottoCount(UserLotto.self)
        
        let countText = "수동으로 \(customLottoCount)장, 자동으로 \(autoLottoCount)장을 구매했습니다."
        
        return lottoTicket.lottoList.reduce(countText) { partialResult, lotto in
            partialResult + "\n" + "[" + format(lotto) + "]"
        }
    }
    
    private static func format(_ lotto: Lotto) -> String {
        return lotto.numbers.sorted()
            .map { String($0) }
            .joined(separator: lottoNumberSeparator)
    }
}
