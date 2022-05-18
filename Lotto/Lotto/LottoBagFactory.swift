//
//  LottoTicketMachine.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoBagFactory {
    let lottoFactory: UserLottoFactory
    
    func make(havingLottoCount lottoCount: Int) throws -> LottoBag {
        let lottoList = try (0..<lottoCount).map { _ in
            try lottoFactory.make()
        }
        return LottoBag(lottoList: lottoList)
    }
}
