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
		let randomNumberGenerator = LottoNumberGenerator(numberGenerator: randomNumberGenerator)
		return try picks(for: tickets, by: randomNumberGenerator)
	}
	
	func playerPicks(for handOperatedLotto: HandOperatedLotto) throws -> [Lotto] {
		return handOperatedLotto.lottos
	}
	
	private func picks(for tickets: Int, by generator: LottoNumberGenerator) throws -> [Lotto] {
		guard tickets > 0 else { throw InputError.unableToPurchase }
		var lottos = [Lotto]()
		try (0..<tickets).forEach { _ in
			let lotto = try generator.generate()
			lottos.append(lotto)
		}
		return lottos
	}
}
