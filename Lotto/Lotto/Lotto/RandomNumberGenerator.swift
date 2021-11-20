//
//  RandomNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct RandomNumberGenerator: NumberGenerator {
	let randomNumberRange: ClosedRange<Int>
	
	private var generateNumber: Int {
		Int.random(in: randomNumberRange)
	}
	
	init(range: ClosedRange<Int>) {
		self.randomNumberRange = range
	}
	
	func generateLottoNumbers() -> [Int] {
		var lottoNumbers = [Int]()
		appendNonDuplicateNumbers(in: &lottoNumbers)
		return lottoNumbers
	}
	
	private func appendNonDuplicateNumbers(in numbers: inout [Int]) {
		if numbers.count == LottoOption.numberOfNumbers { return }
		let lottoNumber = generateNumber
		if isNonDuplicate(lottoNumber, in: numbers) {
			numbers.append(lottoNumber)
		}
		appendNonDuplicateNumbers(in: &numbers)
	}
	
	private func isNonDuplicate(_ numberOfCheck: Int, in numbers: [Int]) -> Bool {
		numbers.contains(numberOfCheck) == false
	}
}
