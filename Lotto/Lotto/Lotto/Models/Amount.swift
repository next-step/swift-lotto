//
//  Amount.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

protocol AmountInputable {
	var amount: Int { get }
	init(input: String?) throws
}

struct Amount: AmountInputable {
	let amount : Int
	
	init(input: String?) throws {
		guard let validInput = input,
					let amount = Int(validInput)
		else { throw InputError.invalid }
		
		if amount < 0 { throw InputError.negativeNumber }
		if amount < 1000 { throw InputError.unableToPurchase }
		
		self.amount = amount
	}
}
