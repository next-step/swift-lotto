//
//  WinningStatistics.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

struct WinningStatistics {
	var numberOfFirstPlace: Int = 0
	var numberOfSecondPlace: Int = 0
	var numberOfThirdPlace: Int = 0
	var numberOfFourthPlace: Int = 0
	
	mutating func winning(_ winnings: Winnings) {
		switch winnings {
		case .firstPlace:
			numberOfFirstPlace += 1
		case .secondPlace:
			numberOfSecondPlace += 1
		case .thirdPlace:
			numberOfThirdPlace += 1
		case .fourthPlace:
			numberOfFourthPlace += 1
		default:
			break
		}
	}
	
	func numberOfWinnings(by winnings: Winnings) -> Int {
		switch winnings {
		case .firstPlace:
			return numberOfFirstPlace
		case .secondPlace:
			return numberOfSecondPlace
		case .thirdPlace:
			return numberOfThirdPlace
		case .fourthPlace:
			return numberOfFourthPlace
		case .notWinning:
			return 0
		}
	}
}
