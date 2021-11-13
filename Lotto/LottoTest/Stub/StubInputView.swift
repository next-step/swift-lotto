//
//  StubInputView.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

struct StubInputView: Inputable {
	private let inputtedAmount: String?
	private let inputtedWinningLottos: String?
	
	init(amount: String?, winningLottos: String?) {
		self.inputtedAmount = amount
		self.inputtedWinningLottos = winningLottos
	}
	
	func makeAmount() throws -> Amount {
		try Amount(input: inputtedAmount)
	}
	
	func makeWinningLotto() -> WinningLotto? {
		WinningLotto(input: inputtedWinningLottos, numberRange: LottoOption.numberRange)
	}
}
