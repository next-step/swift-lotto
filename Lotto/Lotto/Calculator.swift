//
//  Calculator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

final class Calculator {
	func split(_ input: String) -> [String] {
		input.split { [",", ":"].contains($0) }
			.map(String.init)
	}
}
