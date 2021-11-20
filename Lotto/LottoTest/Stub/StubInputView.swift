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
	private let handOperatedNumber: String?
	private let handOperatedLottos: [String?]
	
	init(amount: String?, winningLottos: String?, bonusNumber: String?, handOperatedNumber: String?, handOperatedLottos: [String?]) {
		self.amount = amount
		self.winningLottos = winningLottos
		self.bonusNumber = bonusNumber
		self.handOperatedNumber = handOperatedNumber
		self.handOperatedLottos = handOperatedLottos
	}
	
	func makeAmount() throws -> Amount {
		try Amount(input: amount)
	}
	
	func makeInputWinningLotto() throws -> InputLotto {
		try makeInputLotto(input: winningLottos)
	}
	
	func makeBonusNumber() throws -> BonusNumber {
		try BonusNumber(input: bonusNumber, numberRange: LottoOption.numberRange)
	}
	
	func makeNumberOfHandOperatedLotto(withinAmount amount: Int) throws -> PurchaseNumber {
		try PurchaseNumber(input: handOperatedNumber, amount: amount)
	}
	
	func makeHandOperatedLottos(ofNumber number: PurchaseNumber) throws -> HandOperatedLotto {
		let inputLottos = try handOperatedLottos.map { try makeInputLotto(input: $0) }
		return HandOperatedLotto(inputLotto: inputLottos)
	}
	
	private func makeInputLotto(input: String?) throws -> InputLotto  {
		try InputLotto(input: winningLottos, numberRange: LottoOption.numberRange)
	}
}
