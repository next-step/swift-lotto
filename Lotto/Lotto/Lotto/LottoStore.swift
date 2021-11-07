//
//  LottoStore.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

enum PaymentError {
	case invalid
	case unableToPurchase
}

struct LottoStore {
	let lottoMachine: LottoMachine
	
	init(machine: LottoMachine) {
		self.lottoMachine = machine
	}
	
	func sell(for money: Int) throws -> [[Int]] {
		try isValid(money: money)
		let buyableQuantity = changeToBuyableQuantity(fromMoney: money)
		let lottos = lottoMachine.quickPicks(for: buyableQuantity)
		return lottos
	}
	
	private func isValid(money: Int) throws {
		if money < 0 { PaymentError.invalid }
		if money < 1000 { PaymentError.unableToPurchase }
	}
	
	private func changeToBuyableQuantity(fromMoney money: Int) -> Int {
		money / LottoOption.lottoAmount
	}
}
