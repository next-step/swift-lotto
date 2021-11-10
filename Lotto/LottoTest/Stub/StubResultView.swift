//
//  StubResultView.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

struct StubResultView: Presentable {
	enum Verify {
		static var printOutNumberOfPurchasedLottos = false
		static var printOutPurchasedLottos = false
		static var printOutWinningStatistics = false
		static var printOutRateOfReturn = false
	}
	
	func printOut(numberOfPurchasedLottos: Int) {
		Verify.printOutNumberOfPurchasedLottos = true
	}
	
	func printOut(purchasedLottos: [Lotto]) {
		Verify.printOutPurchasedLottos = true
	}
	
	func printOut(winningStatistics: WinningStatistics) {
		Verify.printOutWinningStatistics = true
	}
	
	func printOut(rateOfReturn: Double) {
		Verify.printOutRateOfReturn = true
	}
}
