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
