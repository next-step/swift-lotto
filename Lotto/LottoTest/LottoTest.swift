//
//  LottoTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/07.
//

import XCTest

class LottoTest: XCTestCase {
	private var stubResultView = StubResultView()
	
	override func tearDownWithError() throws {
		stubResultView = StubResultView()
	}
	
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
	
	func test_shouldGetWinningFourthPlaceWhen3NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 20, 30, 40")
		try buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfFourthPlace, 5)
	}
	
	func test_shouldGetWinningThirdPlaceWhen4NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 30, 40")
		try buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfThirdPlace, 5)
	}
	
	func test_shouldGetWinningSecondPlaceWhen5NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 40")
		try buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfSecondPlace, 5)
	}
	
	func test_shouldGetWinningFirstPlaceWhen6NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 15")
		try buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfFirstPlace, 5)
	}
	
	func test_shouldBeRateOfReturn5WhenBuy14000AndWin70000() throws {
		let buyer = try makeBuyer(amount: "14000", winningLottos: "10, 11, 12, 20, 30, 40")
		try buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.rateOfReturn, 5.0)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotNumber() throws {
		let stubInputView: Inputable = StubInputView(amount: "abcd", winningLottos: "")
	
		XCTAssertThrowsError(try Buyer(inputView: stubInputView, resultView: stubResultView)) { error in
			XCTAssertEqual(error as! InputError, .invalid)
		}
	}
	
	func test_shouldOutputPurchasedLottosWhenBuyerPurchasesLotto() throws {
		let buyer = try makeBuyer(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		try buyer.enter(to: try makeLottoStore())
		
		XCTAssertTrue(StubResultView.Verify.printOutPurchasedLottos)
	}
	
	func test_shouldOutputWinningStatisticsWhenInputWinningNumbers() throws {
		let buyer = try makeBuyer(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		try buyer.enter(to: try makeLottoStore())
		
		XCTAssertTrue(StubResultView.Verify.printOutWinningStatistics)
	}
	
	func test_shouldThrowInvalidErrorWhenWinningNumbersAreNotNumber() throws {
		XCTAssertThrowsError(try makeBuyer(amount: "10000", winningLottos: "abcde")) { error in
			XCTAssertEqual(error as! InputError, .invalid)
		}
	}
	
	func test_shouldThrowInvalidErrorWhenWinningNumbersAreContainedNegativeNumber() throws {
		let buyer = try makeBuyer(amount: "10000", winningLottos: "-100")
		
		XCTAssertThrowsError(try buyer.enter(to: try makeLottoStore())) { error in
			XCTAssertEqual(error as! InputError, .invalid)
		}
	}
	
	func test_shouldOutputErrorMessageWhenThrowsInvalidError() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "10000", winningLottos: "-100"))
		XCTAssertTrue(try verifyPrintOutError(amount: "10000", winningLottos: "abcde"))
		XCTAssertTrue(try verifyPrintOutError(amount: "-1000", winningLottos: "10, 11, 12, 13, 14, 15"))
		XCTAssertTrue(try verifyPrintOutError(amount: "acsdfe", winningLottos: "10, 11, 12, 13, 14, 15"))
		XCTAssertTrue(try verifyPrintOutError(amount: "acsdfe", winningLottos: "abcdef"))
	}
	
	private func verifyPrintOutError(amount: String, winningLottos: String) throws -> Bool {
		let buyer = try makeBuyer(amount: amount, winningLottos: winningLottos)
		try buyer.enter(to: try makeLottoStore())
		return StubResultView.Verify.printOutError
	}
	
	private func makeBuyer(amount: String, winningLottos: String) throws -> Buyer {
		let stubInputView = StubInputView(amount: amount, winningLottos: winningLottos)
		let stubResultView = StubResultView()
		let buyer = try Buyer(inputView: stubInputView, resultView: stubResultView)
		return buyer
	}
	
	private func makeLottoStore() throws -> LottoStore {
		let lottoMachine = LottoMachine(randomNumberGenerator: try makeRandomNumberGenerator())
		return LottoStore(machine: lottoMachine)
	}
	
	private func makeRandomNumberGenerator() throws -> RandomNumberGenerator{
		try RandomNumberGenerator(range: 10...15)
	}
}
