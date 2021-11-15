//
//  BonusNumber.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/12.
//

import Foundation

struct BonusNumber {
	let unwrapped: Int
	
	init(input: String?, numberRange: ClosedRange<Int>) throws {
		guard let validInput = input,
					let bonusNumber = Int(validInput)
		else { throw InputError.invalid }
		
		guard numberRange.contains(bonusNumber) else { throw InputError.outOfRangeInLotto }
		
		self.unwrapped = bonusNumber
	}
}
