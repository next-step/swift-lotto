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
	private(set) var winningStatistics = WinningStatistics()
	
	var money: Int = 0
	var purchasedLottos = [Lotto]()
	
	init(inputView: Inputable, resultView: Presentable) {
		self.resultView = resultView
		self.inputView = inputView
		do {
			try inputView.readAmount { inputtedAmount  in
				self.money = inputtedAmount.amount
			}
		} catch (let error) {
			printOut(error: error)
		}
	}
	
	func enter(to store: LottoStore) {
		guard hasMoney() else { return }
		do {
			try buyLotto(at: store)
			try checkWinningStatistics()
		} catch (let error) {
			printOut(error: error)
		}
	}
	
	private func buyLotto(at store: LottoStore) throws {
		let handOperatedNumbers = try inputView.readHandOperatedNumbers()
		self.purchasedLottos = try store.sell(for: money, handOperatedNumbers: handOperatedNumbers)
		self.resultView.printOut(purchasedLottos: self.purchasedLottos)
	}
	
	private func checkWinningStatistics() throws {
		try self.inputView.readWinningNumber { winningLotto in
			winningStatistics.checkLottoWinningResults(by: winningLotto, purchasedLottos: self.purchasedLottos)
		}
		self.resultView.printOut(winningStatistics: winningStatistics)
	}
	
	private func printOut(error: Error) {
		if let inputError = error as? InputError {
			self.resultView.printOut(error: inputError)
		}
	}
	
	private func hasMoney() -> Bool {
		self.money > 0
	}
}
