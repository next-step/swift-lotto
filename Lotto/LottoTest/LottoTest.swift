//
//  LottoTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/07.
//

import XCTest

class LottoTest: XCTestCase {
	func test_shouldGet5LottosWhenTheLottoMachineQuickPicks5Tickets() throws {
		let randomNumberGenerator = try RandomNumberGenerator(range: 10...15)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lotteryTickets = lottoMachine.quickPicks(for: 5)
		XCTAssertEqual(lotteryTickets.count, 5)
	}
	
	func test_shouldGetNumbersWhenContainedInTheRangeOfRandomNumbers() throws {
		let randomNumberGenerator = try RandomNumberGenerator(range: 10...15)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lotteryTickes = lottoMachine
			.quickPicks(for: 2)
			.map { $0.numbers.sorted { $0 < $1 } }
			.map(Lotto.init)
		
		let results = [Lotto(numbers: [10, 11, 12, 13, 14, 15]), Lotto(numbers: [10, 11, 12, 13, 14, 15])]
		
		XCTAssertEqual(lotteryTickes, results)
	}
	
	func test_shouldGet5TicketsWhenInputIs5200Won() throws {
		let randomNumberGenerator = try RandomNumberGenerator(range: 10...15)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 5200)
		
		XCTAssertEqual(purchasedLottos.count, 5)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotPositiveNumber() throws {
		let randomNumberGenerator = try RandomNumberGenerator(range: 10...15)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lottoStore = LottoStore(machine: lottoMachine)
		
		XCTAssertThrowsError(try lottoStore.sell(for: -100)) { error in
			XCTAssertEqual(error as! PaymentError, .invalid)
		}
		
		XCTAssertThrowsError(try lottoStore.sell(for: -10000)) { error in
			XCTAssertEqual(error as! PaymentError, .invalid)
		}
	}
	
	func test_shouldBeDifferentNumbersWhenLottoIsGenerated() throws {
		let randomNumberGenerator = try RandomNumberGenerator(range: 10...15)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 100000)
		
		let result = Set(purchasedLottos)
		result.forEach { lotto in
			XCTAssertEqual(lotto.numbers.count , 6)
		}
	}
	
	func test_shouldGet5000WonWhen3NumbersMatchEachLotto() {
		let randomNumberGenerator = RandomNumberGenerator(range: 10...15)
		let lottoMachine = LottoMachine(randomNumberGenerator: randomNumberGenerator)
		let lottoStore = LottoStore(machine: lottoMachine)
		let user = User(store: LottoStore)
		user.buyLotto(amount: 5000)
		user.checkLottoWinningResults()

		XCTAssertEqual(user.prizeMoney, 5000)
	}
}
