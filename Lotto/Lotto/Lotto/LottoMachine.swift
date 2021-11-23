//
//  LottoMachine.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct LottoMachine {
	let numberGenerator: NumberGenerator
	
	init(numberGenerator: NumberGenerator) {
		self.numberGenerator = numberGenerator
	}
	
	func quickPicks(for tickets: Int) throws -> [Lotto] {
		let randomNumberGenerator = LottoNumberGenerator(numberGenerator: numberGenerator)
		return try picks(for: tickets, by: randomNumberGenerator)
	}
	
	private func picks(for tickets: Int, by lottoNumberGenerator: LottoNumberGenerator) throws -> [Lotto] {
		var lottos = [Lotto]()
		try (0..<tickets).forEach { _ in
			let lotto = try lottoNumberGenerator.generate()
			lottos.append(lotto)
		}
		return lottos
	}
}
