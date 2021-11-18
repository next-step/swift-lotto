//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

protocol LottoNumberGeneratable {
	func generate() throws -> Lotto
}

protocol NumberGenerator {
	func generateLottoNumbers() -> [Int]
}

struct LottoNumberGenerator: LottoNumberGeneratable {
	let numberGenerator: NumberGenerator
	
	init(numberGenerator: NumberGenerator) {
		self.numberGenerator = numberGenerator
	}

	func generate() throws -> Lotto {
		try Lotto(numbers: numberGenerator.generateLottoNumbers(), numberRange: LottoOption.numberRange)
	}
}
