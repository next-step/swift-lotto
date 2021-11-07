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
		var lottos = [Int]()
		for _ in 0 ..< LottoOption.numberOfLottoNumbers {
			lottos.append(generateNumber())
		}
		return lottos
	}
	
	private func generateNumber() -> Int {
		Int.random(in: randomNumberRange)
	}
}
