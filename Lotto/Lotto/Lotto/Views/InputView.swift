//
//  InputView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

protocol Inputable {
	func read(completion: (AmountInputable) -> Void) throws
	func makeAmount() throws -> Amount
}

extension Inputable {
	func read(completion: (AmountInputable) -> Void) throws {
		let amount = try makeAmount()
		completion(amount)
	}
}

struct InputView: Inputable {
	func makeAmount() throws -> Amount {
		try Amount(input: readLine())
	}
}
