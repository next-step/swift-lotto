//
//  LottoNumberValidatorTests.swift
//  LottoTest
//
//  Created by Kang, Su Jin (강수진) on 2022/05/21.
//

import XCTest

class LottoNumberValidatorTests: XCTestCase {

    var sut: LottoNumberValidator.Type!
    
    override func setUpWithError() throws {
        sut = LottoNumberValidator.self
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - validate
    
    func test_validate_wheNumberIsOverRange_throwContainOutOfRange() throws {
        //given
        let number = 46

        // when
        // then
        let expectation = LottoNumberValidator.LottoNumberValidatorError.containOutOfRange
        XCTAssertThrowsError(try sut.validate(of: number)) { error in
            XCTAssertEqual(error as? LottoNumberValidator.LottoNumberValidatorError, expectation)
        }
    }

    func test_validate_whenNumberIsUnderRange_throwContainOutOfRange() throws {
        //given
        let number = 0

        // when
        // then
        let expectation = LottoNumberValidator.LottoNumberValidatorError.containOutOfRange
        XCTAssertThrowsError(try sut.validate(of: number)) { error in
            XCTAssertEqual(error as? LottoNumberValidator.LottoNumberValidatorError, expectation)
        }
    }
    
    // MARK: - guideDescription
    
    func test_guideDescription_whenNumberIsUnderRange() throws {
        //given
        let number = 0
        
        // when
        // then
        XCTAssertThrowsError(try sut.validate(of: number)) { error in
            let result = (error as? LottoNumberValidator.LottoNumberValidatorError)?.localizedDescription
            let expectation = "1과 45 사이에 포함되지 않는 번호가 있습니다"
            XCTAssertEqual(result, expectation)
        }
    }
}
