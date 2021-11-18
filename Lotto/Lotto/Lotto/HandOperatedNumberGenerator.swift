//
//  HandOperatedNumberGenerator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/18.
//

import Foundation

struct HandOperatedNumberGenerator: NumberGenerator {
	let randomNumberRange: ClosedRange<Int>
	let inputtedLottoNumbers: String
	
	init(input: String, range: ClosedRange<Int>) {
		self.randomNumberRange = range
		self.inputtedLottoNumbers = input
	}
	
	func generateLottoNumbers() -> [Int] {
		inputtedLottoNumbers
			.replacingOccurrences(of: " ", with: "")
			.components(separatedBy: ",")
			.compactMap { lottoNumber in
				Int(lottoNumber)
			}
	}
}
