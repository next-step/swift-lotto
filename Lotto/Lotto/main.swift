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
    try lottoController.winningNumbersSetting()
    try lottoController.winningBonusNumberSetting()
    lottoController.statisticResult()
    
} catch let error as InputError {
    error.showError()
}
