//
//  Winnings.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

enum Winnings: Int {
	case firstPlace = 6
	case secondPlace = 5
	case thirdPlace = 4
	case fourthPlace = 3
	case notWinning = 0
	
	func prize() -> Int {
		switch self {
		case .firstPlace:
			return 2000000000
		case .secondPlace:
			return  1500000
		case .thirdPlace:
			return 50000
		case .fourthPlace:
			return  5000
		case .notWinning:
			return 0
		}
	}
}
