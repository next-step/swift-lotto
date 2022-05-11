//
//  LottoTicketFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoTicketFormatter {
    private static let lottoNumberSeparator = ","
    
    static func format(_ lottoTicket: LottoTicket) -> String {
        return lottoTicket.lottoList.reduce("") { partialResult, lotto in
            partialResult + "[" + format(lotto) + "]" + "\n"
        }
    }
    
    private static func format(_ lotto: Lotto) -> String {
        return lotto.numbers.map { $0.value }
            .sorted()
            .map { String($0) }
            .joined(separator: lottoNumberSeparator)
    }
}
