//
//  Winnings.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

enum Winnings {
	case firstPlace
	case secondPlace
	case thirdPlace
	case fourthPlace
	case fifthPlace
	case notWinning
	
	static func from(matchingCount: Int,
									 matchBonus: Bool = false) -> Self {
		switch matchingCount {
		case 6: return .firstPlace
		case 5 where matchBonus: return .secondPlace
		case 5: return .thirdPlace
		case 4: return .fourthPlace
		case 3: return .fifthPlace
		default: return .notWinning
		}
	}
	
	var prize: Int {
		switch self {
		case .firstPlace: return 2000000000
		case .secondPlace: return 3000000
		case .thirdPlace: return 1500000
		case .fourthPlace: return 50000
		case .fifthPlace: return 5000
		case .notWinning: return 0
		}
	}
	
	var matchCount: Int {
		switch self {
		case .firstPlace: return 6
		case .secondPlace: return 5
		case .thirdPlace: return 5
		case .fourthPlace: return 4
		case .fifthPlace: return 3
		default: return 0
		}
	}
	
	var isMatchingBonusNumber: Bool {
		if self == .secondPlace { return true }
		return false
	}
}
