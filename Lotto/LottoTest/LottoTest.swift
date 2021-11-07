//
//  LottoTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/07.
//

import XCTest

class LottoTest: XCTestCase {
	func test_shouldGet5LottosWhenTheLottoMachineQuickPicks5Tickets() throws {
		let randomNumberGenerator = RandomNumberGenerator(range: 10...10)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lotteryTickets = lottoMachine.quickPicks(for: 5)
		XCTAssertEqual(lotteryTickets.count, 5)
	}
	
	func test_shouldGetNumbersWhenContainedInTheRangeOfRandomNumbers() throws {
		let randomNumberGenerator = RandomNumberGenerator(range: 10...10)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lotteryTickes = lottoMachine.quickPicks(for: 2)
		
		XCTAssertEqual(lotteryTickes, [[10, 10, 10, 10, 10, 10], [10, 10, 10, 10, 10, 10]])
	}
}
