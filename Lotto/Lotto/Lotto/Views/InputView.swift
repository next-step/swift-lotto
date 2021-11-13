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
 	func makeWinningLotto() -> WinningLotto?
}

extension Inputable {
	func readAmount(completion: (AmountInputable) -> Void) throws {
		let amount = try makeAmount()
		completion(amount)
	}
	
	func readWinningNumber(completion: (WinningLotto) -> Void) throws {
		guard let lotto = makeWinningLotto() else {
			throw InputError.invalid
		}
		completion(lotto)
	}
}

struct InputView: Inputable {
	func makeAmount() throws -> Amount {
		print("구입금액을 입력해 주세요.")
		return try Amount(input: readLine())
	}
	
	func makeWinningLotto() -> WinningLotto? {
		print("지난 주 당첨 번호를 입력해 주세요.")
		return WinningLotto(input: readLine(), numberRange: LottoOption.numberRange)
	}
}
