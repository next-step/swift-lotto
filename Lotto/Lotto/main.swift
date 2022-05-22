//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let lottoController = LottoController()

do {
    let money = try lottoController.setMoneyAndValidPositive()
    let lottoCount = lottoController.moneyToLottoCount(input: money)
    let manualCount = try lottoController.setInputLottoCountAndValidPositive()
    let manulLottos = try lottoController.setMutualLottos(inputCount: manualCount)
    
    let totalLottos = lottoController.setTotalLottos(lottoCount: lottoCount, manualSetLotto: manulLottos)
    try lottoController.checkLottoRange(lottos: totalLottos)
    lottoController.appearLottos(input: totalLottos)
    try lottoController.setWinningNumbers()
    try lottoController.setWinningBonusNumber()
    lottoController.printStatisticResult(money: money, lottos: totalLottos)
    
} catch let error as InputError {
    error.showError()
}
