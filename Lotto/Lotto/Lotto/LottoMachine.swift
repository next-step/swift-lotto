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
		(0..<tickets).forEach { _ in
			if let lotto = lottoNumberGenerator.generate() {
				lottos.append(lotto)
			}
		}
		return lottos
	}
}
