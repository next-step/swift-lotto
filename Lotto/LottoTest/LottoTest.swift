//
//  LottoTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/07.
//

import XCTest

class LottoTest: XCTestCase {
	fileprivate var stubResultView = StubResultView()
	
	override func tearDownWithError() throws {
		clearStub()
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
	
	func test_shouldGetWinningFifthPlaceWhen3NumbersMatchEachLotto() throws {
		let buyer = makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 20, 30, 40")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertEqual(buyer.winningStatistics.numberOfFifthPlace, 5)
	}
	
	func test_shouldGetWinningFourthPlaceWhen4NumbersMatchEachLotto() throws {
		let buyer = makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 30, 40")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertEqual(buyer.winningStatistics.numberOfFourthPlace, 5)
	}
	
	func test_shouldGetWinningThirdPlaceWhen5NumbersMatchEachLotto() throws {
		let buyer = makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 40")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertEqual(buyer.winningStatistics.numberOfThirdPlace, 5)
	}
	
	func test_shouldGetWinningSecondPlaceWhen5NumbersMatchEachLottoAndBonusNumber() throws {
		let buyer = makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 40", bonusNumber: "15")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertEqual(buyer.winningStatistics.numberOfSecondPlace, 5)
	}
	
	func test_shouldGetWinningFirstPlaceWhen6NumbersMatchEachLotto() throws {
		let buyer = makeBuyer(amount: "5000", winningLottos: "10, 11, 12, 13, 14, 15")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertEqual(buyer.winningStatistics.numberOfFirstPlace, 5)
	}
	
	func test_shouldBeRateOfReturn5WhenBuy14000AndWin70000() throws {
		let buyer = makeBuyer(amount: "14000", winningLottos: "10, 11, 12, 20, 30, 40")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertEqual(buyer.winningStatistics.rateOfReturn, 5.0)
	}
	
	func test_shouldThrowInvalidErrorWhenAmountIsNotNumber() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "abcd", winningLottos: ""))
	}
	
	func test_shouldOutputPurchasedLottosWhenBuyerPurchasesLotto() throws {
		let buyer = makeBuyer(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertTrue(StubResultView.Verify.printOutPurchasedLottos)
	}
	
	func test_shouldOutputWinningStatisticsWhenInputWinningNumbers() throws {
		let buyer = makeBuyer(amount: "10000", winningLottos: "10, 11, 12, 13, 14, 15")
		buyer.enter(to: makeLottoStore())
		
		XCTAssertTrue(StubResultView.Verify.printOutWinningStatistics)
		XCTAssertEqual(stubResultView.winningStatistics?.numberOfFirstPlace, 10)
	}
	
	func test_shouldThrowInvalidErrorWhenWinningNumbersAreNotNumber() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "10000", winningLottos: "abcde"))
		XCTAssertEqual(stubResultView.error!, InputError.invalid)
	}
	
	func test_shouldThrowInvalidErrorWhenWinningNumbersAreContainedNegativeNumber() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "10000", winningLottos: "-100"))
		XCTAssertEqual(stubResultView.error, InputError.invalid)
	}
	
	func test_shouldOutputErrorMessageWhenThrowsInvalidError() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "-1000", winningLottos: "10, 11, 12, 13, 14, 15"))
		XCTAssertEqual(stubResultView.error, InputError.negativeNumber)
		clearStub()
		XCTAssertTrue(try verifyPrintOutError(amount: "acsdfe", winningLottos: "10, 11, 12, 13, 14, 15"))
		XCTAssertEqual(stubResultView.error, InputError.invalid)
	}
	
	func test_shouldOutputOutOfRangeErrorWhenInputNumberIsOutOfTheLottoNumberRange() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "1000", winningLottos: "10, 11, 12, 13, 14, 46"))
		XCTAssertEqual(stubResultView.error, InputError.outOfRange)
		clearStub()
		XCTAssertTrue(try verifyPrintOutError(amount: "1000", winningLottos: "10, 11, 12, 13, 14, 15", bonusNumber: "46"))
		XCTAssertEqual(stubResultView.error, InputError.outOfRange)
	}
	
	func test_shouldOutputMismatchErrorWhenInputNumberIsDeifferentFromTheLottoDigits() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "1000", winningLottos: "10, 11, 12, 13, 14, 46, 47"))
		XCTAssertEqual(stubResultView.error, InputError.mismatchedNumber)
		clearStub()
		XCTAssertTrue(try verifyPrintOutError(amount: "1000", winningLottos: "10, 11, 12, 13", bonusNumber: "46"))
		XCTAssertEqual(stubResultView.error, InputError.mismatchedNumber)
	}
	
	func test_shouldOutputDuplicateErrorWhenInputNumberIsDuplicated() throws {
		XCTAssertTrue(try verifyPrintOutError(amount: "1000", winningLottos: "10, 11, 12, 13, 14, 10"))
		XCTAssertEqual(stubResultView.error, InputError.duplicatedNumber)
		clearStub()
		XCTAssertTrue(try verifyPrintOutError(amount: "1000", winningLottos: "10, 11, 12, 13, 11, 10", bonusNumber: "46"))
		XCTAssertEqual(stubResultView.error, InputError.duplicatedNumber)
	}
	
	func test_shouldGetLottoWhenUsingHandOperatedMachine() throws {
		let handOperatedMachine = HandOperatedNumberGenerator(input: "10, 11, 12, 13, 14, 15", range: LottoOption.numberRange)
		let lottoNumberGenerator = LottoNumberGenerator(numberGenerator: handOperatedMachine)
		let lotto = try lottoNumberGenerator.generate()
		XCTAssertEqual(lotto.numbers, [10, 11, 12, 13, 14, 15])
	}
	
	private func verifyPrintOutError(amount: String, winningLottos: String, bonusNumber: String = "45") throws -> Bool {
		let buyer = makeBuyer(amount: amount, winningLottos: winningLottos, bonusNumber: bonusNumber)
		buyer.enter(to: makeLottoStore())
		return StubResultView.Verify.printOutError
	}
	
	private func clearStub() {
		stubResultView.clear()
	}
	
	private func makeBuyer(amount: String, winningLottos: String, bonusNumber: String = "45") -> Buyer {
		let stubInputView = StubInputView(amount: amount, winningLottos: winningLottos, bonusNumber: bonusNumber)
		let buyer = Buyer(inputView: stubInputView, resultView: stubResultView)
		return buyer
	}
	
	private func makeLottoStore() -> LottoStore {
		let lottoMachine = LottoMachine(randomNumberGenerator: makeRandomNumberGenerator())
		return LottoStore(machine: lottoMachine)
	}
	
	private func makeRandomNumberGenerator(range: ClosedRange<Int> = 10...15) -> RandomNumberGenerator{
		RandomNumberGenerator(range: range)
	}
}
