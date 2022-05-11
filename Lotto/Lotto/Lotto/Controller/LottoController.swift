//
//  Controller.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

final class LottoController {
    private let inputView = InputView()
    private let resultView = ResultView()
    private let lottoGenerator = LottoGenerator()
    private var lottos: [Lotto] = []
    private let lottoInputText = "지난 주 당첨 번호를 입려해 주세요."
    
    
    func lotterySetting() throws {
        let stringMoney = inputView.lotteryInputMoney()
        let intMoney = try inputView.changeIntMoney(stringMoney)
        let lottoCount = lottoGenerator.moneyToLottoCount(intMoney)
        inputView.lotteryTotalCount(lottoCount)
        lottos = lottoGenerator.generate(count: lottoCount)
    }
}
