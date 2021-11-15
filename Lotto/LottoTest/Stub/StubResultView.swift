//
//  StubResultView.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

struct StubResultView: Presentable {
	enum Verify {
		static var printOutPurchasedLottos = false
		static var printOutWinningStatistics = false
		static var printOutError = false
	}
	
	func printOut(purchasedLottos: [Lotto]) {
		Verify.printOutPurchasedLottos = true
	}
	
	func printOut(winningStatistics: WinningStatistics) {
		Verify.printOutWinningStatistics = true
	}
	
	func printOut(error: InputError) {
		Verify.printOutError = true
	}
}
