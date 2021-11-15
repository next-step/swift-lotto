//
//  InputView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

protocol Inputable {
	func readAmount(completion: (AmountInputable) -> Void) throws
	func readWinningNumber(completion: (WinningLotto) -> Void) throws
	func makeAmount() throws -> Amount
 	func makeInputWinningLotto() throws -> InputWinningLotto
	func makeBonusNumber() throws -> BonusNumber
}

extension Inputable {
	func readAmount(completion: (AmountInputable) -> Void) throws {
		let amount = try makeAmount()
		completion(amount)
	}
	
	func readWinningNumber(completion: (WinningLotto) -> Void) throws {
		let inputWinningLotto = try makeInputWinningLotto()
		let inputBonusNumber = try makeBonusNumber()
		
		let winningLotto = WinningLotto(inputWinningLotto: inputWinningLotto, inputBonusNumber: inputBonusNumber)
		completion(winningLotto)
	}
}

struct InputView: Inputable {
	func makeAmount() throws -> Amount {
		print("구입금액을 입력해 주세요.")
		return try Amount(input: readLine())
	}
	
	func makeInputWinningLotto() throws -> InputWinningLotto {
		print("지난 주 당첨 번호를 입력해 주세요.")
		return try InputWinningLotto(input: readLine(), numberRange: LottoOption.numberRange)
	}
	
	func makeBonusNumber() throws -> BonusNumber {
		print("보너스 번호를 입력해 주세요.")
		return try BonusNumber(input: readLine(), numberRange: LottoOption.numberRange)
	}
}
