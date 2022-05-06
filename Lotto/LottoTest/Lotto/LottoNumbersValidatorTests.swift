//
//  LottoNumbersValidatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/06.
//

import XCTest

class LottoNumbersValidatorTests: XCTestCase {

    var sut: LottoNumbersValidator!
    
    override func setUpWithError() throws {
        sut = LottoNumbersValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_validate() throws {
        //given
        let input = [1,2,3,4,5,6]
        
        // when
        // then
        XCTAssertNoThrow(try sut.validate(of: input))
    }
    
    func test_validate_whenNumbersCountIsUnderSix_throwInvalidNumberCount() {
        //given
        let numbers = [1,2,3,4,5]
        
        // when
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.invalidNumberCount
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
    
    func test_validate_whenNumbersCountIsOverSix_throwInvalidNumberCount() {
        //given
        let numbers = [1,2,3,4,5,6,7]
        
        // when
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.invalidNumberCount
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
    
    func test_validate_wheNumbersContainOverRanged_throwContainOutOfRange() throws {
        //given
        let numbers = [1,2,3,4,5,46]
        
        // when
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.containOutOfRange
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
    
    func test_validate_whenNumbersContainUnderRanged_throwContainOutOfRange() throws {
        //given
        let numbers = [0,1,2,3,4,5]
        
        // when
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.containOutOfRange
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
    
    func test_validate_whenNumbersAreDuplicated_throwHasDuplicate() throws {
        //given
        let numbers = [1,2,3,4,5,5]
        
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.hasDuplicate
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
}
