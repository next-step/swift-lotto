//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let lottoController = LottoController()

do {
    try lottoController.lotterySetting()
    lottoController.lottoPrinter()
    try lottoController.setWinningNumbers()
    try lottoController.setWinningBonusNumber()
    lottoController.printStatisticResult()
    
} catch let error as InputError {
    error.showError()
}
