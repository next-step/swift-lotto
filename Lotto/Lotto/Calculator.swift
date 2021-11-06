//
//  Calculator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

final class Calculator {
	func add(_ input: String) throws -> Int {
		try split(input)
			.map { try $0.toPositiveInt() }
			.reduce(0) { partialResult, number in
				partialResult + number
			}
	}
	
	func split(_ input: String) -> [String] {
		input.split {
			[",", ":"].contains($0)
		}.map(String.init)
	}
}
