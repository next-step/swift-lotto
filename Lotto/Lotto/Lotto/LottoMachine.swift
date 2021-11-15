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
	
	func quickPicks(for tickets: Int) throws -> [Lotto] {
		guard tickets > 0 else { throw InputError.unableToPurchase }
		let lottoNumberGenerator = AutomaticGenerator(randomNumberGenerator: randomNumberGenerator)
		var lottos = [Lotto]()
		try (0..<tickets).forEach { _ in
			let lotto = try lottoNumberGenerator.generate()
			lottos.append(lotto)
		}
		return lottos
	}
}
