//
//  Buyer.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

final class Buyer {
	private let resultView: Presentable
	private let inputView: Inputable
	private(set) var prizeMoney: Int = 0
	private(set) var rateOfReturn: Double = 0
	
	var money: Int = 0
	var purchasedLottos = [Lotto]()
	
	init(inputView: Inputable, resultView: Presentable) throws {
		self.resultView = resultView
		self.inputView = inputView
		try inputView.read { inputtedAmount  in
			self.money = inputtedAmount.amount
		}
	}
	
	func enter(to store: LottoStore) throws {
		try buyLotto(at: store)
		try self.checkWinningStatistics()
	}

	private func buyLotto(at store: LottoStore) throws {
		self.purchasedLottos = try store.sell(for: money)
		self.resultView.printOut(purchasedLottos: self.purchasedLottos)
	}
	
	private func checkWinningStatistics() throws {
		try self.inputView.read { winningLotto in
			checkLottoWinningResults(winningLotto: winningLotto)
		}
	}
	
	private func checkLottoWinningResults(winningLotto: WinningLotto) {
		var winningStatistics = WinningStatistics()
		self.purchasedLottos.forEach { lotto in
			let winnings = lotto.checkWinningRanking(with: winningLotto)
			winningStatistics.winning(winnings)
			self.prizeMoney += winnings.prize()
		}
		
		self.rateOfReturn = calculateRateOfReturn()
		self.resultView.printOut(winningStatistics: winningStatistics)
	}
	
	private func calculateRateOfReturn() -> Double {
		let purchasedAmount = Double(self.purchasedLottos.count * LottoOption.lottoAmount)
		let prizeMoney = Double(self.prizeMoney)
		return (prizeMoney / purchasedAmount).floorTwoDecimalPlaces
	}
}
