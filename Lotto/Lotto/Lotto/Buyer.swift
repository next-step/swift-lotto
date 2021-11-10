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
	
	var money: Int = 0
	var purchasedLottos = [Lotto]()
	
	init(inputView: Inputable) throws {
		try inputView.read { inputtedAmount  in
			self.money = inputtedAmount.amount
		}
	}
	
	func buyLotto(at store: LottoStore) throws {
		self.purchasedLottos = try store.sell(for: money)
	}
	
	func checkLottoWinningResults(winningNumber: Lotto) {
		var winningStatistics = WinningStatistics()
		self.purchasedLottos.forEach { lotto in
			let winnings = lotto.checkWinningRanking(with: winningNumber)
			winningStatistics.winning(winnings)
			self.prizeMoney += winnings.prize()
		}
		
		self.rateOfReturn = calculateRateOfReturn()
	}
	
	func calculateRateOfReturn() -> Double {
		let purchasedAmount = Double(self.purchasedLottos.count * LottoOption.lottoAmount)
		let prizeMoney = Double(self.prizeMoney)
		return (prizeMoney / purchasedAmount).floorTwoDecimalPlaces
	}
}
