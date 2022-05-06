//
//  PurchaseMoneyValidatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/07.
//

import XCTest

class PurchaseMoneyValidatorTests: XCTestCase {

    var sut: PurchaseMoneyValidator!
    
    override func setUpWithError() throws {
        sut = PurchaseMoneyValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_validate_whenInputIsUnitOfPositiveThousand() throws {
        //given
        let input = 1000
        
        // when
        // then
        XCTAssertNoThrow(try sut.validate(of: input))
    }
    
    func test_validate_whenInputIsUnderThousand_throwUnderMinimumMoney() {
        //given
        let input = 900
        
        // when
        // then
        let expectation = PurchaseMoneyValidator.PurchaseMoneyValidatorError.underMinimumMoney
        XCTAssertThrowsError(try sut.validate(of: input)) { error in
            XCTAssertEqual(error as? PurchaseMoneyValidator.PurchaseMoneyValidatorError, expectation)
        }
    }
    
    func test_validate_whenInputIsNotDivisibleByThousand_throwNotUnitOfLotto() {
        //given
        let input = 1100
        
        // when
        // then
        let expectation = PurchaseMoneyValidator.PurchaseMoneyValidatorError.notUnitOfLotto
        XCTAssertThrowsError(try sut.validate(of: input)) { error in
            XCTAssertEqual(error as? PurchaseMoneyValidator.PurchaseMoneyValidatorError, expectation)
        }
    }
}
