//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let lottoController = LottoController()

do {
    let money = try lottoController.receiveInputMoneyAndValifyPositiveNumber()
    let lottoCount = lottoController.moneyToLottoCount(input: money)
    let manualCount = try lottoController.receiveInputLottoCountAndValifyPositiveNumber()
    let manulLottos = try lottoController.receiveInputMutualLottosAndVerifyLottoRule(inputCount: manualCount)
    
    let totalLottos = lottoController.generateTotalLottos(lottoCount: lottoCount, manualSetLotto: manulLottos)
    try lottoController.checkLottoRange(lottos: totalLottos)
    lottoController.appearLottos(input: totalLottos)
    try lottoController.receiveInputWinningNumbersAndVerifyLottoRule()
    try lottoController.receiveWinningBonusNumberAndVerifyContainingRange()
    lottoController.printStatisticResult(money: money, lottos: totalLottos)
    
} catch let error as InputError {
    error.showError()
}
