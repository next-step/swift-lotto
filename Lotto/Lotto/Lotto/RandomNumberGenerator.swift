//
//  RandomNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct RandomNumberGenerator {
	let randomNumberRange: ClosedRange<Int>
	
	init(range: ClosedRange<Int>) {
		self.randomNumberRange = range
	}
	
	func generateLottoNumbers() -> [Int] {
		var lottoNumbers = [Int]()
		for _ in 0 ..< LottoOption.numberOfLottoNumbers {
			lottoNumbers.append(generateNumber())
		}
		return lottoNumbers
	}
	
	private func generateNumber() -> Int {
		Int.random(in: randomNumberRange)
	}
}
