//
//  LottoController.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct LottoController {
    let inputView = CustomerInputView()
    let outputView = CustomerResultView()
    
    func playLotto() throws {
        let consumer = LottoCustomer()
        
        guard let consumePrice = inputView.readPrice() else { throw LottoError.invalidInput }
        consumer.buyLotto(for: consumePrice)
        outputView.printLottos(of: consumer)
        
        guard let prizeNumbers = inputView.readPrizeNumbers() else { throw LottoError.invalidInput }
        let prizes = consumer.checkLottoPrizes(with: prizeNumbers)
        outputView.printStatistics(of: prizes)
        
        outputView.printPrizeRatio(of: consumer, totalPrizeMoney: prizes.reduce(0, { $0 + $1.rawValue }))
    }
}
