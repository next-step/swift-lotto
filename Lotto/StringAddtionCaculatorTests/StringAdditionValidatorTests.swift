//
//  StringAdditionValidatorTests.swift
//  StringAdditionCaculator
//
//  Created by jinho jeong on 2022/05/04.
//

import XCTest
@testable import Lotto

class StringAdditionValidatorTests: XCTestCase {

    let sut: StringAdditionValidator = StringAdditionValidator()
    
    func test_givenNil_or_빈문자열_when유효성검사_then숫자0반환() {
        //given
        let given: String? = nil
        
        //when
        let result = sut.checkEmptyString(given)
        
        //then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }

    func test_given비어져있지않은_문자열_when유효성검사_then숫자반환() {
        //given
        let given: String? = "12345"
        
        //when
        let result = sut.checkEmptyString(given)
        
        //then
        let expectation: Int = 12345
        XCTAssertEqual(result, expectation)
        
    }
    
    func test_given음수문자열_when유효성검사_then에러반환() throws {
        //given
        let given: Int = -1
        
        
        //when && then
        let expectation: StringAdditionError = StringAdditionError.negativeNumber
        
        XCTAssertThrowsError(try sut.validationNegative(number: given)) { error in
            XCTAssertEqual(error as? StringAdditionError, expectation)
        }
    }
    func test_given문자열_when유효성검사_then에러반환() throws {
        //given
        let given: Int = -1
        
        
        //when && then
        let expectation: StringAdditionError = StringAdditionError.negativeNumber
        
        XCTAssertThrowsError(try sut.validationNegative(number: given)) { error in
            XCTAssertEqual(error as? StringAdditionError, expectation)
        }
    }
}
