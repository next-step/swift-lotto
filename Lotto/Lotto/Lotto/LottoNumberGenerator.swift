//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

protocol NumberGenerator {
	func generateLottoNumbers() -> [Int]
}

struct LottoNumberGenerator {
	let numberGenerator: NumberGenerator
	
	init(numberGenerator: NumberGenerator) {
		self.numberGenerator = numberGenerator
	}

	func generate() throws -> Lotto {
		try Lotto(numbers: numberGenerator.generateLottoNumbers(), numberRange: LottoOption.numberRange)
	}
}
