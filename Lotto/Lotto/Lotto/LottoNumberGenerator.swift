//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

protocol LottoNumberGeneratable {
	func generate() -> [Int]
}


struct AutomaticGenerator: LottoNumberGeneratable {
	let randomNumberGenerator: RandomNumberGenerator
	
	init(randomNumberGenerator: RandomNumberGenerator) {
		self.randomNumberGenerator = randomNumberGenerator
	}
	
	func generate() -> [Int] {
		randomNumberGenerator.generateLottoNumbers()
	}
}
