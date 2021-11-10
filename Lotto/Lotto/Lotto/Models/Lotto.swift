//
//  Lotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct Lotto: Equatable, Hashable {
	let numbers: [Int]
	init?(numbers: [Int], numberRange: ClosedRange<Int>) {
		guard numbers.filter({ numberRange.contains($0) }).count == LottoOption.numberOfLottoNumbers else {
			return nil
		}
					
		self.numbers = numbers
	}
}

extension Lotto {
	func checkWinningRanking(with winningNumbers: Lotto) -> Winnings {
		let numberOfMatchingNumbers = findNumberOfMatchingNumbers(with: winningNumbers)
		return findWinningRanking(numberOfMatchingNumbers: numberOfMatchingNumbers)
	}
	
	private func findNumberOfMatchingNumbers(with winningNumbers: Lotto) -> Int {
		Set(numbers).intersection(Set(winningNumbers.numbers)).count
	}
	
	private func findWinningRanking(numberOfMatchingNumbers: Int) -> Winnings {
		Winnings(rawValue: numberOfMatchingNumbers) ?? .notWinning
	}
}
