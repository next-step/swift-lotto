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
    
    // MARK: - validate
    
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
    
    // MARK: - validateBonusNumber
    
    func test_validateBonusNumber() throws {
        //given
        let bonusNumber = 45
        let winningNumbers = [1,2,3,4,5,6]
        
        // when
        // then
        XCTAssertNoThrow(try sut.validateBonusNumber(bonusNumber, in: winningNumbers))
    }
    
    func test_validateBonusNumber_whenBonusNumbersIsDuplicated_throwHasDuplicate() throws {
        //given
        let bonusNumber = 1
        let winningNumbers = [1,2,3,4,5,6]
        
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.hasDuplicate
        XCTAssertThrowsError(try sut.validateBonusNumber(bonusNumber, in: winningNumbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
    
    func test_validateBonusNumber_whenBonusNumbersIsOverRanged_throwContainOutOfRange() throws {
        //given
        let bonusNumber = 46
        let winningNumbers = [1,2,3,4,5,6]
        
        // then
        let expectation = LottoNumbersValidator.LottoNumbersValidatorError.containOutOfRange
        XCTAssertThrowsError(try sut.validateBonusNumber(bonusNumber, in: winningNumbers)) { error in
            XCTAssertEqual(error as? LottoNumbersValidator.LottoNumbersValidatorError, expectation)
        }
    }
    
    // MARK: - guideDescription
    
    func test_guideDescription_whenNumbersCountIsUnderSix() {
        //given
        let numbers = [1,2,3,4,5]
        
        // when
        // then
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            let result = (error as? LottoNumbersValidator.LottoNumbersValidatorError)?.guideDescription
            let expectation = "로또 번호 개수가 6개가 아닙니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_wheNumbersContainOverRanged() throws {
        //given
        let numbers = [1,2,3,4,5,46]
        
        // when
        // then
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            let result = (error as? LottoNumbersValidator.LottoNumbersValidatorError)?.guideDescription
            let expectation = "1과 45 사이에 포함되지 않는 번호가 있습니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_whenNumbersAreDuplicated() throws {
        //given
        let numbers = [1,2,3,4,5,5]
        
        // when
        // then
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            let result = (error as? LottoNumbersValidator.LottoNumbersValidatorError)?.guideDescription
            let expectation = "중복되는 번호가 있습니다"
            XCTAssertEqual(result, expectation)
        }
    }
}
