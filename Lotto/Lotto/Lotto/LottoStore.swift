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
	
	func sell(for money: Int) throws -> [Lotto] {
		let buyableQuantity = changeToBuyableQuantity(fromMoney: money)
		let lottos = try lottoMachine.quickPicks(for: buyableQuantity)
		return lottos
	}
	
	private func changeToBuyableQuantity(fromMoney money: Int) -> Int {
		money / LottoOption.amount
	}
}
