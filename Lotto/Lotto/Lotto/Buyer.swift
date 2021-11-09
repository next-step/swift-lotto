//
//  Buyer.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

final class Buyer {
	private(set) var prizeMoney: Int = 0
	private(set) var rateOfReturn: Double = 0
	
	let lottoStore: LottoStore
	var money: Int = 0
	var purchasedLottos = [Lotto]()
	
	init(store: LottoStore, inputView: Inputable) throws {
		self.lottoStore = store
		try inputView.read { inputtedAmount  in
			self.money = inputtedAmount.amount
		}
	}
	
	func buyLotto() throws {
		self.purchasedLottos = try lottoStore.sell(for: money)
	}
	
	func checkLottoWinningResults(winningNumber: Lotto) {
		self.purchasedLottos.forEach { lotto in
			let winnings = lotto.checkWinningRanking(with: winningNumber)
			self.prizeMoney += winnings.getPrize()
		}
		
		self.rateOfReturn = calculateRateOfReturn()
	}
	
	func calculateRateOfReturn() -> Double {
		let purchasedAmount = Double(self.purchasedLottos.count * LottoOption.lottoAmount)
		let prizeMoney = Double(self.prizeMoney)
		return (prizeMoney / purchasedAmount).floorTwoDecimalPlaces
	}
}
