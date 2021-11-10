//
//  LottoTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/07.
//

import XCTest

class LottoTest: XCTestCase {
	private let stubResultView = StubResultView()
	
	func test_shouldGet5LottosWhenTheLottoMachineQuickPicks5Tickets() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lotteryTickets = lottoMachine.quickPicks(for: 5)
		XCTAssertEqual(lotteryTickets.count, 5)
	}
	
	func test_shouldGetNumbersWhenContainedInTheRangeOfRandomNumbers() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lotteryTickes = lottoMachine
			.quickPicks(for: 2)
			.map { $0.numbers.sorted { $0 < $1 } }
			.map { Lotto(numbers: $0, numberRange: LottoOption.lottoNumberRange) }
		
		let results = [Lotto(numbers: [10, 11, 12, 13, 14, 15], numberRange: LottoOption.lottoNumberRange), Lotto(numbers: [10, 11, 12, 13, 14, 15], numberRange: LottoOption.lottoNumberRange)]
		
		XCTAssertEqual(lotteryTickes, results)
	}
	
	func test_shouldGet5TicketsWhenInputIs5200Won() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 5200)
		
		XCTAssertEqual(purchasedLottos.count, 5)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotPositiveNumber() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		
		XCTAssertThrowsError(try lottoStore.sell(for: -100)) { error in
			XCTAssertEqual(error as! InputError, .invalid)
		}
		
		XCTAssertThrowsError(try lottoStore.sell(for: -10000)) { error in
			XCTAssertEqual(error as! InputError, .invalid)
		}
	}
	
	func test_shouldBeDifferentNumbersWhenLottoIsGenerated() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 100000)
		
		let result = Set(purchasedLottos)
		result.forEach { lotto in
			XCTAssertEqual(lotto.numbers.count , 6)
		}
	}
	
	func test_shouldGet5000WonWhen3NumbersMatchEachLotto() throws {
		let stubInputView: Inputable = StubInputView(amount: "5000", winningLottos: "10, 11, 12, 20, 30, 40")
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		let buyer = try Buyer(inputView: stubInputView, resultView: stubResultView)
		try buyer.enter(to: lottoStore)

		XCTAssertEqual(buyer.prizeMoney, 25000)
	}
	
	func test_shouldBeRateOfReturn5WhenBuy14000AndWin70000() throws {
		let stubInputView: Inputable = StubInputView(amount: "14000", winningLottos: "10, 11, 12, 20, 30, 40")
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		let buyer = try Buyer(inputView: stubInputView, resultView: stubResultView)
		try buyer.enter(to: lottoStore)

		XCTAssertEqual(buyer.rateOfReturn, 5.0)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotNumber() throws {
		let stubInputView: Inputable = StubInputView(amount: "abcd", winningLottos: "")
	
		XCTAssertThrowsError(try Buyer(inputView: stubInputView, resultView: stubResultView)) { error in
			XCTAssertEqual(error as! InputError, .invalid)
		}
	}
	
	func test_shouldOutputPurchasedLottosWhenBuyerPurchasesLotto() throws {
		let stubInputView = StubInputView(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		let stubResultView = StubResultView()
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		let buyer = try Buyer(inputView: stubInputView, resultView: stubResultView)
		try buyer.enter(to: lottoStore)
		
		XCTAssertTrue(StubResultView.Verify.printOutPurchasedLottos)
	}
	
	func test_shouldOutputWinningStatisticsWhenInputWinningNumbers() throws {
		let stubInputView = StubInputView(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		let stubResultView = StubResultView()
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		let buyer = try Buyer(inputView: stubInputView, resultView: stubResultView)
		try buyer.enter(to: lottoStore)
		
		XCTAssertTrue(StubResultView.Verify.printOutWinningStatistics)
	}
	
	func test_shouldOutputWRateOfReturnWhenInputWinningNumbers() throws {
		let stubInputView = StubInputView(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		let stubResultView = StubResultView()
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		let buyer = try Buyer(inputView: stubInputView, resultView: stubResultView)
		try buyer.enter(to: lottoStore)
		
		XCTAssertTrue(StubResultView.Verify.printOutRateOfReturn)
	}
	
	private func makeRandomNumberGenerator() throws -> RandomNumberGenerator{
		try RandomNumberGenerator(range: 10...15)
	}
}
