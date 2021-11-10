//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

protocol LottoNumberGeneratable {
	func generate() -> Lotto?
}

struct AutomaticGenerator: LottoNumberGeneratable {
	let randomNumberGenerator: RandomNumberGenerator
	
	init(randomNumberGenerator: RandomNumberGenerator) {
		self.randomNumberGenerator = randomNumberGenerator
	}
	
	func generate() -> Lotto? {
		Lotto(numbers: randomNumberGenerator.generateLottoNumbers(), numberRange: LottoOption.lottoNumberRange)
	}
}
