//
//  LottoTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/07.
//

import XCTest

class LottoTest: XCTestCase {
	func test_shouldGet5LottosWhenTheLottoMachineQuickPicks5Tickets() throws {
		let lottoMachine = LottoMachine()
		let lotteryTickets = lottoMachine.quickPicks(for: 5)
		XCTAssertEqual(lotteryTickets.count, 5)
	}
}
