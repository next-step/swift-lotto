//
//  WinningLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

protocol WinningLottoInputable {
	var lotto: Lotto { get }
	init(input: String?, numberRange: ClosedRange<Int>) throws
}

struct WinningLotto: WinningLottoInputable {
	let lotto : Lotto
	
	init(input: String?, numberRange: ClosedRange<Int>) throws {
		guard let validInput = input else { throw InputError.invalid }

		self.lotto = try Lotto(numbers: validInput, numberRange: numberRange)
	}
}
