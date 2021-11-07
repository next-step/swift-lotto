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
		
		XCTAssertEqual(lotteryTickes, [Lotto(numbers: [10, 10, 10, 10, 10, 10]), Lotto(numbers: [10, 10, 10, 10, 10, 10])])
	}
	
	func test_shouldGet5TicketsWhenInputIs5200Won() throws {
		let randomNumberGenerator = RandomNumberGenerator(range: 10...10)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 5200)
		
		XCTAssertEqual(purchasedLottos.count, 5)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotPositiveNumber() throws {
		let randomNumberGenerator = RandomNumberGenerator(range: 10...10)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lottoStore = LottoStore(machine: lottoMachine)
		
		XCTAssertThrowsError(try lottoStore.sell(for: "-100")) { error in
			XCTAssertEqual(error as! PaymentError, .invalid)
		}
	}
}
