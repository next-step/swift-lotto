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
		guard numbers.filter({ numberRange.contains($0) }).count == LottoOption.numberOfNumbers else {
			throw InputError.mismatchedNumber
		}
		
		guard Set(numbers).count == LottoOption.numberOfNumbers else {
			throw InputError.duplicatedNumber
		}
					
		self.numbers = numbers.sorted(by: <)
	}
	
	init(numbers: String, numberRange: ClosedRange<Int>) throws {
		guard let validNumbers = try? numbers.splitToIntByComma() else {
			throw InputError.invalid
		}
		
		try self.init(numbers: validNumbers, numberRange: numberRange)
	}
}

extension Lotto {
	func checkWinningRanking(with winningLotto: WinningLotto) -> Winnings {
		let numberOfMatchingNumbers = findNumberOfMatchingNumbers(with: winningLotto)
		return findWinningRanking(numberOfMatchingNumbers: numberOfMatchingNumbers)
	}
	
	private func findNumberOfMatchingNumbers(with winningLotto: WinningLotto) -> Int {
		Set(numbers).intersection(Set(winningLotto.lotto.numbers)).count
	}
	
	private func findWinningRanking(numberOfMatchingNumbers: Int) -> Winnings {
		Winnings(rawValue: numberOfMatchingNumbers) ?? .notWinning
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

extension Lotto {
	func checkWinningRanking(with winningNumbers: Lotto) -> Winnings {
		let numberOfMatchingNumbers = findNumberOfMatchingNumbers(with: winningNumbers)
		switch numberOfMatchingNumbers {
		case 6:
			return Winnings.firstPlace
		case 5:
			return Winnings.secondPlace
		case 4:
			return Winnings.thirdPlace
		case 3:
			return Winnings.fourthPlace
		default:
			return Winnings.notWinning
		}
	}
	
	private func findNumberOfMatchingNumbers(with winningNumbers: Lotto) -> Int {
		self.numbers
			.filter { lottoNumber in
				winningNumbers.numbers.contains(lottoNumber)
			}.count
	}
}
