//
//  InputWinningLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/12.
//

import Foundation

struct InputWinningLotto {
	let lotto: Lotto
	init?(input: String?, numberRange: ClosedRange<Int>) {
		guard let validInput = input,
					let lotto = try? Lotto(numbers: validInput.splitToIntByComma(), numberRange: numberRange)
		else { return nil }
		
		self.lotto = lotto
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
