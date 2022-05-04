//
//  StringAdditionConverterTests.swift
//  StringAdditionCaculator
//
//  Created by jinho jeong on 2022/05/04.
//

import XCTest
@testable import Lotto

class StringAdditionConverterTests: XCTestCase {

    let sut: StringAdditionConverter = StringAdditionConverter()
    
    func test_given숫자로_변환되지않는_문자열_when변환_thenNil값반환() {
        //given
        let given = "MOOYAHO"
        //when
        let result = sut.convertToInteger(from: given)
        //then
        let expectation: Int? = nil
        XCTAssertEqual(result, expectation)
        
    }
    
    func test_given숫자로_변환되는_문자열_when변환_then숫자반환() {
        //given
        let given = "12345"
        //when
        let result = sut.convertToInteger(from: given)
        //then
        let expectation: Int? = 12345
        XCTAssertEqual(result, expectation)
    }

}

