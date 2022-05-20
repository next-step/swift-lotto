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
        return lottoTicket.lottoList.reduce("") { partialResult, lotto in
            partialResult + "[" + format(lotto) + "]" + "\n"
        }
    }
    
    private static func format(_ lotto: Lotto) -> String {
        return lotto.numbers.sorted()
            .map { String($0) }
            .joined(separator: lottoNumberSeparator)
    }
}
