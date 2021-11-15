//
//  StubInputView.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

struct StubInputView: Inputable {
	
	private let amount: String?
	private let winningLottos: String?
	private let bonusNumber: String?
	
	init(amount: String?, winningLottos: String?, bonusNumber: String?) {
		self.amount = amount
		self.winningLottos = winningLottos
		self.bonusNumber = bonusNumber
	}
	
	func makeAmount() throws -> Amount {
		try Amount(input: amount)
	}
	
	func makeInputWinningLotto() throws -> InputWinningLotto {
		try InputWinningLotto(input: winningLottos, numberRange: LottoOption.numberRange)
	}
	
	func makeBonusNumber() throws -> BonusNumber {
		try BonusNumber(input: bonusNumber, numberRange: LottoOption.numberRange)
	}
}
