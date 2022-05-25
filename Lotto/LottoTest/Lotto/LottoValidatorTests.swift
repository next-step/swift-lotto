//
//  LottoValidatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/06.
//

import XCTest

class LottoValidatorTests: XCTestCase {

    var sut: LottoValidator.Type!
    
    override func setUpWithError() throws {
        sut = LottoValidator.self
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - validate
    
    func test_validate() throws {
        //given
        let input = try [1,2,3,4,5,6].map(LottoNumber.init)
        
        // when
        // then
        XCTAssertNoThrow(try sut.validate(of: input))
    }
    
    func test_validate_whenNumbersCountIsUnderSix_throwInvalidNumberCount() throws {
        //given
        let numbers = try [1,2,3,4,5].map(LottoNumber.init)
        
        // when
        // then
        let expectation = LottoValidator.LottoValidatorError.invalidNumberCount
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoValidator.LottoValidatorError, expectation)
        }
    }
    
    func test_validate_whenNumbersCountIsOverSix_throwInvalidNumberCount() throws {
        //given
        let numbers = try [1,2,3,4,5,6,7].map(LottoNumber.init)
        
        // when
        // then
        let expectation = LottoValidator.LottoValidatorError.invalidNumberCount
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? LottoValidator.LottoValidatorError, expectation)
        }
    }
    
    func test_validate_whenNumbersAreDuplicated_throwHasDuplicate() throws {
        //given
        let numbers = try [1,2,3,4,5,5].map(LottoNumber.init)
        
        // then
        let expectation = UniqueLottoNumbersError.hasDuplicate
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            XCTAssertEqual(error as? UniqueLottoNumbersError, expectation)
        }
    }
    
    // MARK: - guideDescription
    
    func test_guideDescription_whenNumbersCountIsUnderSix() throws {
        //given
        let numbers = try [1,2,3,4,5].map(LottoNumber.init)
        
        // when
        // then
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            let result = (error as? LottoValidator.LottoValidatorError)?.localizedDescription
            let expectation = "로또 번호 개수가 6개가 아닙니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_whenNumbersAreDuplicated() throws {
        //given
        let numbers = try [1,2,3,4,5,5].map(LottoNumber.init)
        
        // when
        // then
        XCTAssertThrowsError(try sut.validate(of: numbers)) { error in
            let result = (error as? UniqueLottoNumbersError)?.localizedDescription
            let expectation = "중복되는 번호가 있습니다"
            XCTAssertEqual(result, expectation)
        }
    }
}
