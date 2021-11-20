//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = InputView()
let resultView = ResultView()
let randomGenerator = RandomNumberGenerator(range: LottoOption.numberRange)
let lottoMachine = LottoMachine(numberGenerator: randomGenerator)
let lottoStore = LottoStore(machine: lottoMachine)
let buyer = Buyer(inputView: inputView, resultView: resultView)
buyer.enter(to: lottoStore)
