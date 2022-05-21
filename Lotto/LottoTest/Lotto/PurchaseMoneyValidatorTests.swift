//
//  PurchaseLottoValidatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/07.
//

import XCTest

class PurchaseLottoValidatorTests: XCTestCase {

    var sut: PurchaseLottoValidator.Type!
    
    override func setUpWithError() throws {
        sut = PurchaseLottoValidator.self
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_validateMoney_whenInputIsUnitOfPositiveThousand() throws {
        //given
        let input = 1000
        
        // when
        // then
        XCTAssertNoThrow(try sut.validateMoney(input))
    }
    
    func test_validateMoney_whenInputIsUnderThousand_throwUnderMinimumMoney() {
        //given
        let input = 900
        
        // when
        // then
        let expectation = PurchaseLottoValidator.PurchaseLottoValidatorError.underMinimumMoney
        XCTAssertThrowsError(try sut.validateMoney(input)) { error in
            XCTAssertEqual(error as? PurchaseLottoValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    func test_validateMoney_whenInputIsNotDivisibleByThousand_throwNotUnitOfLotto() {
        //given
        let input = 1100
        
        // when
        // then
        let expectation = PurchaseLottoValidator.PurchaseLottoValidatorError.notUnitOfLotto
        XCTAssertThrowsError(try sut.validateMoney(input)) { error in
            XCTAssertEqual(error as? PurchaseLottoValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    func test_validateCount_whenPurchaseCountIsInBudget() {
        //given
        let purchaseCount = 1
        let budget = 1000
        
        // when
        // then
        XCTAssertNoThrow(try sut.validateCount(purchaseCount, inBudget: budget))
    }
    
    func test_validatCount_whenPurchaseCountIsUnderZero_throwInvalidPurchaseCount() {
        //given
        let purchaseCount = -1
        let budget = 1000
        
        // when
        // then
        let expectation = PurchaseLottoValidator.PurchaseLottoValidatorError.invalidPurchaseCount
        XCTAssertThrowsError(try sut.validateCount(purchaseCount, inBudget: budget)) { error in
            XCTAssertEqual(error as? PurchaseLottoValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    func test_validatCount_whenPurchaseCountIsOverBudget_throwInvalidPurchaseCount() {
        //given
        let purchaseCount = 2
        let budget = 1000
        
        // when
        // then
        let expectation = PurchaseLottoValidator.PurchaseLottoValidatorError.invalidPurchaseCount
        XCTAssertThrowsError(try sut.validateCount(purchaseCount, inBudget: budget)) { error in
            XCTAssertEqual(error as? PurchaseLottoValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    // MARK: - errorDescription

    func test_errorDescription_whenInputIsUnderThousand() {
        //given
        let input = 900
        
        // when
        // then
        XCTAssertThrowsError(try sut.validateMoney(input)) { error in
            let result = error.localizedDescription
            let expectation = "로또를 구입하기 위해서는 1000원 이상이 필요합니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_errorDescription_whenInputIsNotDivisibleByThousand() {
        //given
        let input = 1100
        
        // when
        // then
        XCTAssertThrowsError(try sut.validateMoney(input)) { error in
            let result = error.localizedDescription
            let expectation = "금액이 로또 금액인 1000원 단위로 나뉘어지지 않습니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_errorDescription_whenPurchaseCountIsUnderZero() {
        //given
        let purchaseCount = -1
        let budget = 1000
        
        // when
        // then
        XCTAssertThrowsError(try sut.validateCount(purchaseCount, inBudget: budget)) { error in
            let result = error.localizedDescription
            let expectation = "유효한 로또 구입 개수가 아닙니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_errorDescription_whenPurchaseCountIsOverBudget() {
        //given
        let purchaseCount = 2
        let budget = 1000
        
        // when
        // then
        XCTAssertThrowsError(try sut.validateCount(purchaseCount, inBudget: budget)) { error in
            let result = error.localizedDescription
            let expectation = "유효한 로또 구입 개수가 아닙니다"
            XCTAssertEqual(result, expectation)
        }
    }
}
