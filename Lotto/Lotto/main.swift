//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = InputView()
let resultView = ResultView()
do {
	let randomGenerator = try RandomNumberGenerator(range: LottoOption.lottoNumberRange)
	let lottoMachine = LottoMachine(randomNumberGenerator: randomGenerator)
	let lottoStore = LottoStore(machine: lottoMachine)
	let buyer = try Buyer(inputView: inputView, resultView: resultView)
	try buyer.enter(to: lottoStore)
} catch {
}
