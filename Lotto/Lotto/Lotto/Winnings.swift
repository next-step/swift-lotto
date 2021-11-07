//
//  Winnings.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

enum Winnings: Int {
	case firstPlace = 2000000000
	case secondPlace = 1500000
	case thirdPlace = 50000
	case fourthPlace = 5000
	case notWinning = 0
	
	func getPrize() -> Int {
		self.rawValue
	}
}
