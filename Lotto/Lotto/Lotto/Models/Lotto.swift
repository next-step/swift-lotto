//
//  Lotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct Lotto: Equatable, Hashable {
	let numbers: [Int]

	init(numbers: [Int], numberRange: ClosedRange<Int>) throws {
		try numbers.checkValidNumber(in: numberRange)
		self.numbers = numbers.sorted(by: <)
	}
	
	init(numbers: String, numberRange: ClosedRange<Int>) throws {
		guard let validNumbers = try? numbers.splitToIntByComma() else {
			throw InputError.invalid
		}
		try validNumbers.checkValidNumber(in: numberRange)
		try self.init(numbers: validNumbers, numberRange: numberRange)
	}
}

extension Lotto {
	func checkWinningRanking(with winningLotto: WinningLotto) -> Winnings {
		let numberOfMatchingNumbers = findNumberOfMatchingNumbers(with: winningLotto)
		return findWinningRanking(numberOfMatchingNumbers: numberOfMatchingNumbers, bonusNumber: winningLotto.bonusNumber)
	}
	
	private func findNumberOfMatchingNumbers(with winningLotto: WinningLotto) -> Int {
		Set(numbers).intersection(Set(winningLotto.lotto.numbers)).count
	}
	
	private func findWinningRanking(numberOfMatchingNumbers: Int, bonusNumber: Int) -> Winnings {
		Winnings.from(matchingCount: numberOfMatchingNumbers, matchBonus: numbers.contains(bonusNumber))
	}
}


fileprivate extension String {
	func splitToIntByComma() throws -> [Int] {
		try self.replacingOccurrences(of: " ", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
			.components(separatedBy: ",")
			.map {
				try $0.toPositiveInt()
			}
	}
}

fileprivate extension Array where Element == Int {
	func checkValidNumber(in numberRange: ClosedRange<Int>) throws {
		guard self.count == LottoOption.numberOfNumbers else {
			throw InputError.mismatchedNumber
		}
		
		guard self.filter({ numberRange.contains($0) }).count == LottoOption.numberOfNumbers else {
			throw InputError.outOfRange
		}
		
		guard Set(self).count == LottoOption.numberOfNumbers else {
			throw InputError.duplicatedNumber
		}
	}
}
