//
//  Buyer.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

final class Buyer {
	private(set) var prizeMoney: Int = 0
	let lottoStore: LottoStore
	var purchasedLottos = [Lotto]()

	init(store: LottoStore) {
		self.lottoStore = store
	}
	
	func buyLotto(by amount: Int) throws {
		self.purchasedLottos = try lottoStore.sell(for: amount)
	}
	
	func checkLottoWinningResults(winningNumber: Lotto) {
		purchasedLottos.forEach { lotto in
			let winnings = lotto.checkWinningRanking(with: winningNumber)
			prizeMoney += winnings.getPrize()
		}
	}
}
