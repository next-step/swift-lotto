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
	func generate() -> [Int] {
		return [1, 2, 3, 4, 5, 6]
	}
}
