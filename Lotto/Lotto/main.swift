//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let lottoController = LottoController()

do {
    let money = try lottoController.setMoney()
    let lottoCount = lottoController.moneyToLottoCount(input: money)
    let autoLottos = lottoController.setAutoLottos(lottoCount: lottoCount)
    lottoController.appearLottos(input: autoLottos)
    try lottoController.setWinningNumbers()
    try lottoController.setWinningBonusNumber()
    lottoController.printStatisticResult(money: money, lottos: autoLottos)
    
} catch let error as InputError {
    error.showError()
}
