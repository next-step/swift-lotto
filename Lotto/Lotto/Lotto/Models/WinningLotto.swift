//
//  WinningLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

protocol WinningLottoInputable {
	var lotto: Lotto { get }
	init(input: String?) throws
}

struct WinningLotto: WinningLottoInputable {
	let lotto : Lotto
	
	init?(input: String?, numberRange: ClosedRange<Int>) {
		guard let validInput = input,
					let splitedNumber = validInput.split(separator: ",").map(Int.init)
					let lotto = Lotto(numbers: splitedNumber, numberRange: numberRange)
		else { return nil }
		
		self.lotto = lotto
	}
}
