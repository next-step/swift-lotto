//
//  InputView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

protocol Inputable {
	func read(completion: (AmountInputable) -> Void) throws
	func read(completion: (WinningLotto) -> Void) throws
	func makeAmount() throws -> Amount
	func makeInputWinningLotto() -> InputWinningLotto?
	func makeBonusNumber() -> BonusNumber?
}

extension Inputable {
	func read(completion: (AmountInputable) -> Void) throws {
		let amount = try makeAmount()
		completion(amount)
	}
	
	func read(completion: (WinningLotto) -> Void) throws {
		guard let inputWinningLotto = makeInputWinningLotto(),
					let bonusNumber = makeBonusNumber()
		else {
			throw InputError.invalid
		}
		let winningLotto = WinningLotto(inputWinningLotto: inputWinningLotto, inputBonusNumber: bonusNumber)
		completion(winningLotto)
	}
}

struct InputView: Inputable {
	func makeAmount() throws -> Amount {
		print("구입금액을 입력해 주세요.")
		return try Amount(input: readLine())
	}
	
	func makeInputWinningLotto() -> InputWinningLotto? {
		print("지난 주 당첨 번호를 입력해 주세요.")
		return InputWinningLotto(input: readLine(), numberRange: LottoOption.lottoNumberRange)
	}
	
	func makeBonusNumber() -> BonusNumber? {
		print("보너스 번호를 입력해 주세요.")
		return BonusNumber(input: readLine(), numberRange: LottoOption.lottoNumberRange)
	}
}
