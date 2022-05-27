//
//  LottoController.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct LottoController {
    private let inputView = ConsumerInputView()
    private let outputView = ConsumerResultView()
    
    func playLotto() throws {
        let consumer = LottoConsumer()
        
        guard let consumePrice = inputView.readPrice() else { throw LottoError.invalidInput }
        try consumer.buyLotto(for: consumePrice)
        outputView.printLottos(of: consumer)
        
        guard let prizeNumbers = inputView.readPrizeNumbers() else { throw LottoError.invalidInput }
        guard let bonusNumber = inputView.readBonusNumber() else { throw LottoError.invalidInput }
        
        let prizes = consumer.checkLottoPrizes(with: prizeNumbers, bonusNumber: bonusNumber)
        outputView.printStatistics(of: prizes)
        
        
        
        outputView.printPrizeRatio(of: consumer, totalPrizeMoney: prizes.reduce(0, { $0 + $1.rawValue }))
    }
}
