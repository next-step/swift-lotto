//
//  LottoBonusNumberValidatorTests.swift
//  LottoTest
//
//  Created by Kang, Su Jin (강수진) on 2022/05/17.
//

import XCTest

class LottoBonusNumberValidatorTests: XCTestCase {

    var sut: LottoBonusNumberValidator.Type!
    
    override func setUpWithError() throws {
        sut = LottoBonusNumberValidator.self
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - validate
    
    func test_validate() throws {
        //given
        let bonusNumber = try LottoNumber(value: 45)
        let winningNumbers = try [1,2,3,4,5,6].map(LottoNumber.init)
        let winningLotto = try Lotto(numbers: winningNumbers)
        
        // when
        // then
        XCTAssertNoThrow(try sut.validate(bonusNumber, in: winningLotto))
    }
    
    func test_validate_whenBonusNumbersIsDuplicated_throwHasDuplicate() throws {
        //given
        let bonusNumber = try LottoNumber(value: 1)
        let winningNumbers = try [1,2,3,4,5,6].map(LottoNumber.init)
        let winningLotto = try Lotto(numbers: winningNumbers)
        
        // then
        let expectation = LottoValidator.LottoValidatorError.hasDuplicate
        XCTAssertThrowsError(try sut.validate(bonusNumber, in: winningLotto)) { error in
            XCTAssertEqual(error as? LottoValidator.LottoValidatorError, expectation)
        }
    }
}
