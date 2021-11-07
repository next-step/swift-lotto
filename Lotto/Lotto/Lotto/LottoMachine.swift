//
//  LottoMachine.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct LottoMachine {
	func quickPicks(for tickets: Int) -> [[Int]] {
		let lottoNumberGenerator = AutomaticGenerator()
		var lottos = [[Int]]()
		for _ in 0 ..< tickets {
			let generatedLotto = lottoNumberGenerator.generate()
			lottos.append(generatedLotto)
		}
		return lottos
	}
}
