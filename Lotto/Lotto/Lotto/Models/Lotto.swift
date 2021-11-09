//
//  Lotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct Lotto: Equatable, Hashable {
	let numbers: [Int]
	init(numbers: [Int]) {
		self.numbers = numbers
	}
}

extension Lotto {
	func checkWinningRanking(with winningNumbers: Lotto) -> Winnings {
		let numberOfMatchingNumbers = findNumberOfMatchingNumbers(with: winningNumbers)
		return findWinningRanking(numberOfMatchingNumbers: numberOfMatchingNumbers)
	}
	
	private func findNumberOfMatchingNumbers(with winningNumbers: Lotto) -> Int {
		self.numbers
			.filter { lottoNumber in
				winningNumbers.numbers.contains(lottoNumber)
			}.count
	}
	
	private func findWinningRanking(numberOfMatchingNumbers: Int) -> Winnings {
		Winnings(rawValue: numberOfMatchingNumbers) ?? .notWinning
	}
}
