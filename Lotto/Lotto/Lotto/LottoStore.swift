//
//  LottoStore.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct LottoStore {
	private let lottoMachine: LottoMachine
	
	init(machine: LottoMachine) {
		self.lottoMachine = machine
	}
	
	func sell(for money: Int, handOperatedNumbers: HandOperatedLotto? = nil) throws -> [Lotto] {
		let handOperatedLotto = handOperatedNumbers?.lottos ?? []
		let buyableQuantity = try changeToBuyableQuantity(fromMoney: money, numberAlreadyPurchased: handOperatedLotto.count)
		let quickPickLottos = try quickPicks(for: buyableQuantity)
		return handOperatedLotto + quickPickLottos
	}
	
	private func quickPicks(for buyableQuantity: Int) throws -> [Lotto] {
		if buyableQuantity == 0 { return [] }
		return try lottoMachine.quickPicks(for: buyableQuantity)
	}
	
	private func changeToBuyableQuantity(fromMoney money: Int, numberAlreadyPurchased: Int) throws -> Int {
		let buyableQuantity = money / LottoOption.amount - numberAlreadyPurchased
		guard money >= LottoOption.amount,
					buyableQuantity >= 0
		else { throw InputError.unableToPurchase }
		
		return buyableQuantity
	}
}
