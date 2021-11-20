//
//  InputWinningLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/12.
//

import Foundation

struct InputLotto {
	let lotto: Lotto
	init(input: String?, numberRange: ClosedRange<Int>) throws {
		guard let validInput = input else { throw InputError.invalid }
		self.lotto = try Lotto(numbers: validInput, numberRange: numberRange)
	}
}
