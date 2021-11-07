//
//  LottoMachine.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct LottoMachine {
	let randomNumberGenerator: RandomNumberGenerator
	
	init(randomNumberGenerator: RandomNumberGenerator) {
		self.randomNumberGenerator = randomNumberGenerator
	}
	
	func quickPicks(for tickets: Int) -> [Lotto] {
		let lottoNumberGenerator = AutomaticGenerator(randomNumberGenerator: randomNumberGenerator)
		var lottos = [Lotto]()
		for _ in 0 ..< tickets {
			let generatedLotto = lottoNumberGenerator.generate()
			lottos.append(generatedLotto)
		}
		return lottos
	}
}
