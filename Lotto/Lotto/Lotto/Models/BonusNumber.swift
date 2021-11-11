//
//  BonusNumber.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/12.
//

import Foundation

struct BonusNumber {
	let unwrapped: Int
	
	init?(input: String?, numberRange: ClosedRange<Int>) {
		guard let validInput = input,
					let bonusNumber = Int(validInput),
				 numberRange.contains(bonusNumber)
		else { return nil }
		
		self.unwrapped = bonusNumber
	}
}
