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
		clearVerify()
	}
	
	func test_shouldGet5LottosWhenTheLottoMachineQuickPicks5Tickets() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		let lotto = try lottoMachine.quickPicks(for: 5)
		XCTAssertEqual(lotto.count, 5)
	}
	
	func test_shouldGetNumbersWhenContainedInTheRangeOfRandomNumbers() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		let lotto = try lottoMachine.quickPicks(for: 2)
		
		let results = [try Lotto(numbers: [10, 11, 12, 13, 14, 15], numberRange: LottoOption.numberRange), try Lotto(numbers: [10, 11, 12, 13, 14, 15], numberRange: LottoOption.numberRange)]
		
		XCTAssertEqual(lotto, results)
	}
	
	func test_shouldGet5TicketsWhenInputIs5200Won() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 5200)
		
		XCTAssertEqual(purchasedLottos.count, 5)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotPositiveNumber() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		
		XCTAssertThrowsError(try lottoStore.sell(for: -100)) { error in
			XCTAssertEqual(error as! InputError, .unableToPurchase)
		}
		
		XCTAssertThrowsError(try lottoStore.sell(for: -10000)) { error in
			XCTAssertEqual(error as! InputError, .unableToPurchase)
		}
	}
	
	func test_shouldBeDifferentNumbersWhenLottoIsGenerated() throws {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		let lottoStore = LottoStore(machine: lottoMachine)
		
		let purchasedLottos = try lottoStore.sell(for: 100000)
		
		let result = Set(purchasedLottos)
		result.forEach { lotto in
			XCTAssertEqual(lotto.numbers.count , 6)
		}
	}
	
	func test_shouldGetWinningFourthPlaceWhen3NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 20, 30, 40")
		buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfFourthPlace, 5)
	}
	
	func test_shouldGetWinningThirdPlaceWhen4NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 30, 40")
		buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfThirdPlace, 5)
	}
	
	func test_shouldGetWinningSecondPlaceWhen5NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 40")
		buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfSecondPlace, 5)
	}
	
	func test_shouldGetWinningFirstPlaceWhen6NumbersMatchEachLotto() throws {
		let buyer = try makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 15")
		buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.numberOfFirstPlace, 5)
	}
	
	func test_shouldBeRateOfReturn5WhenBuy14000AndWin70000() throws {
		let buyer = try makeBuyer(amount: "14000", winningLottos: "10, 11, 12, 20, 30, 40")
		buyer.enter(to: try makeLottoStore())

		XCTAssertEqual(buyer.winningStatistics.rateOfReturn, 5.0)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotNumber() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "abcd", winningLottos: ""))
	}
	
	func test_shouldOutputPurchasedLottosWhenBuyerPurchasesLotto() throws {
		let buyer = try makeBuyer(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		buyer.enter(to: try makeLottoStore())
		
		XCTAssertTrue(StubResultView.Verify.printOutPurchasedLottos)
	}
	
	func test_shouldOutputWinningStatisticsWhenInputWinningNumbers() throws {
		let buyer = try makeBuyer(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		buyer.enter(to: try makeLottoStore())
		
		XCTAssertTrue(StubResultView.Verify.printOutWinningStatistics)
	}
	
	func test_shouldThrowInvalidErrorWhenWinningNumbersAreNotNumber() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "10000", winningLottos: "abcde"))
	}
	
	func test_shouldThrowInvalidErrorWhenWinningNumbersAreContainedNegativeNumber() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "10000", winningLottos: "-100"))
	}
	
	func test_shouldOutputErrorMessageWhenThrowsInvalidError() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "-1000", winningLottos: "10, 11, 12, 13, 14, 15"))
		clearVerify()
		XCTAssertTrue(try verifyPrintOutError(amount: "acsdfe", winningLottos: "10, 11, 12, 13, 14, 15"))
	}
	
	private func verifyPrintOutError(amount: String, winningLottos: String) throws -> Bool {
		let buyer = try makeBuyer(amount: amount, winningLottos: winningLottos)
		buyer.enter(to: try makeLottoStore())
		return StubResultView.Verify.printOutError
	}
	
	private func clearVerify() {
		StubResultView.Verify.printOutPurchasedLottos = false
		StubResultView.Verify.printOutWinningStatistics = false
		StubResultView.Verify.printOutError = false
	}
	
	private func makeBuyer(amount: String, winningLottos: String) throws -> Buyer {
		let stubInputView = StubInputView(amount: amount, winningLottos: winningLottos)
		let stubResultView = StubResultView()
		let buyer = Buyer(inputView: stubInputView, resultView: stubResultView)
		return buyer
	}
	
	private func makeLottoStore() throws -> LottoStore {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		return LottoStore(machine: lottoMachine)
	}
	
	private func makeRandomNumberGenerator() -> RandomNumberGenerator{
		RandomNumberGenerator(range: 10...15)
	}
	
	func test_shouldGetNumbersWhenContainedInTheRangeOfRandomNumbers() throws {
		let randomNumberGenerator = RandomNumberGenerator(range: 10...10)
		let lottoMachine = LottoMachine()
		let lotteryTickes = lottoMachine.quickPicks(for: 2)
		
		XCTAssertEqual(lotteryTickes, [[10, 10, 10, 10, 10, 10], [10, 10, 10, 10, 10, 10]])
	}
	
	func test_shouldGet5TicketsWhenInputIs5200Won() {
		let lottoStore = LottoStore()
		let purchasedLottos = bulottoStore.sell(for: 5200)
		
		XCTAssertEqual(purchasedLottos.count, 5)
	}
}
