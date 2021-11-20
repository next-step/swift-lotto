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
		guard let number = Int(validInput),
					number >= 0
		else { throw InputError.negativeNumber }
		
		self.validNumber = number
	}
}
