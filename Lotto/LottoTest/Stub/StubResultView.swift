//
//  StubResultView.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

final class StubResultView: Presentable {
	enum Verify {
		static var printOutPurchasedLottos = false
		static var printOutWinningStatistics = false
		static var printOutError = false
	}
	
	var winningStatistics: WinningStatistics? = nil
	var error: InputError? = nil
	
	func printOut(purchasedLottos: [Lotto]) {
		Verify.printOutPurchasedLottos = true
	}
	
	func printOut(winningStatistics: WinningStatistics) {
		self.winningStatistics = winningStatistics
		Verify.printOutWinningStatistics = true
	}
	
	func printOut(error: InputError) {
		self.error = error
		Verify.printOutError = true
	}
	
	func clear() {
		winningStatistics = nil
		error = nil
		Verify.printOutPurchasedLottos = false
		Verify.printOutWinningStatistics = false
		Verify.printOutError = false
	}
}
