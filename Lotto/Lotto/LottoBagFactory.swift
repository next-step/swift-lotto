//
//  LottoTicketMachine.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoBagFactory {
    let lottoFactory: UserLottoFactory
    
    func make(havingLottoCount lottoCount: Int, with lottos: [Lotto] = []) throws -> LottoBag {
        let givenLottoCount = lottos.count
        let lottoList = try (0..<lottoCount - givenLottoCount).map { _ in
            try lottoFactory.make()
        }
        return LottoBag(lottoList: lottoList + lottos)
    }
}
