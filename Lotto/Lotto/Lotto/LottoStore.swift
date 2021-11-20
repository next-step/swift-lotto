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
		let buyableQuantity = changeToBuyableQuantity(fromMoney: money)
		let quickPickLottos = try lottoMachine.quickPicks(for: buyableQuantity)
		let handOperatedLotto = handOperatedNumbers?.lottos ?? []
		return quickPickLottos + handOperatedLotto
	}
	
	private func changeToBuyableQuantity(fromMoney money: Int) -> Int {
		money / LottoOption.amount
	}
}
