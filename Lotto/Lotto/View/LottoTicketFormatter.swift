//
//  LottoTicketFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoTicketFormatter {
    static func format(_ lottoTicket: LottoTicket) -> String {
        var result = ""
    
        for lotto in lottoTicket.lottoList {
            let formattedLotto = lotto.numbers.map { $0.value }
                .sorted()
                .map { String($0) }
                .joined(separator: ",")
            
            result = result + "[\(formattedLotto)]" + "\n"
        }
        
        return result
    }
}
