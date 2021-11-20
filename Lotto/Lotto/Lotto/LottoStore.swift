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
		let buyableQuantity = changeToBuyableQuantity(fromMoney: money, numberAlreadyPurchased: handOperatedLotto.count)
		let quickPickLottos = try lottoMachine.quickPicks(for: buyableQuantity)
		return quickPickLottos + handOperatedLotto
	}
	
	private func changeToBuyableQuantity(fromMoney money: Int, numberAlreadyPurchased: Int) -> Int {
		let buyableQuantity = money / LottoOption.amount
		return buyableQuantity - numberAlreadyPurchased
	}
}
