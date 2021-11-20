//
//  InputView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

protocol Inputable {
	func readAmount() throws -> AmountInputable
	func readWinningNumber() throws -> WinningLotto
	func readHandOperatedNumbers(withinAmount amount: Int) throws -> HandOperatedLotto?
	func makeAmount() throws -> Amount
 	func makeInputWinningLotto() throws -> InputLotto
	func makeBonusNumber() throws -> BonusNumber
	func makeNumberOfHandOperatedLotto(withinAmount amount: Int) throws -> PurchaseNumber
	func makeHandOperatedLottos(ofNumber number: PurchaseNumber) throws -> HandOperatedLotto
}

extension Inputable {
	func readAmount() throws -> AmountInputable {
		return try makeAmount()
	}
	
	func readWinningNumber() throws -> WinningLotto{
		let inputWinningLotto = try makeInputWinningLotto()
		let inputBonusNumber = try makeBonusNumber()
		let winningLotto = WinningLotto(inputWinningLotto: inputWinningLotto, inputBonusNumber: inputBonusNumber)
		return winningLotto
	}
	
	func readHandOperatedNumbers(withinAmount amount: Int) throws -> HandOperatedLotto? {
		let numberOfHandOperatedLotto = try makeNumberOfHandOperatedLotto(withinAmount: amount)
		if willBuyHandOperatedLottos(numberOf: numberOfHandOperatedLotto) {
			return try makeHandOperatedLottos(ofNumber: numberOfHandOperatedLotto)
		}
		return nil
	}
	
	private func willBuyHandOperatedLottos(numberOf numberOfHandOperatedLotto: PurchaseNumber) -> Bool {
		numberOfHandOperatedLotto.validNumber > 0
	}
}

struct InputView: Inputable {
	func makeAmount() throws -> Amount {
		print("구입금액을 입력해 주세요.")
		return try Amount(input: readLine())
	}
	
	func makeInputWinningLotto() throws -> InputLotto {
		print("지난 주 당첨 번호를 입력해 주세요.")
		return try InputLotto(input: readLine(), numberRange: LottoOption.numberRange)
	}
	
	func makeBonusNumber() throws -> BonusNumber {
		print("보너스 번호를 입력해 주세요.")
		return try BonusNumber(input: readLine(), numberRange: LottoOption.numberRange)
	}
	
	func makeNumberOfHandOperatedLotto(withinAmount amount: Int) throws -> PurchaseNumber {
		print("\n수동으로 구매할 로또 수를 입력해 주세요.")
		return try PurchaseNumber(input: readLine(), amount: amount)
	}
	
	func makeHandOperatedLottos(ofNumber number: PurchaseNumber) throws -> HandOperatedLotto {
		print("\n수동으로 구매할 번호를 입력해 주세요.")
		let inputLottos = try (0...number.validNumber - 1)
			.map { _ in try InputLotto(input: readLine(), numberRange: LottoOption.numberRange) }
		return HandOperatedLotto(inputLotto: inputLottos)
	}
}
