//
//  PurchaseNumber.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/20.
//

import Foundation

struct PurchaseNumber {
	let validNumber: Int
	
	init(input: String?) throws {
		guard let validInput = input else { throw InputError.invalid }
		
		let number = try validInput.toPositiveInt()
		self.validNumber = number
	}
}
