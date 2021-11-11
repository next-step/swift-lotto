//
//  WinningLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

protocol WinningLottoInputable {
	var lotto: Lotto { get }
	var bonusNumber: Int { get }
	init?(input: String?, inputBonusNumber: String?, numberRange: ClosedRange<Int>) throws
}

struct WinningLotto: WinningLottoInputable {
	let lotto : Lotto
	let bonusNumber: Int
	
	init?(input: String?, inputBonusNumber: String?, numberRange: ClosedRange<Int>) {
		guard let validInput = input,
					let lotto = try? Lotto(numbers: validInput.splitToIntByComma(), numberRange: numberRange),
					let validInputBonusNumber = inputBonusNumber,
					let bonusNumber = Int(validInputBonusNumber),
					numberRange.contains(bonusNumber)
		else { return nil }
		
		self.lotto = lotto
		self.bonusNumber = bonusNumber
	}
}

fileprivate extension String {
	func splitToIntByComma() throws -> [Int] {
		try self.replacingOccurrences(of: " ", with: "")
			.components(separatedBy: ",")
			.map {
				try $0.toPositiveInt()
			}
	}
}
