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
		
		self.amount = amount
	}
}
