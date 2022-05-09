//
//  StringAdditionCaculatorTests.swift
//  StringAdditionCaculator
//
//  Created by jinho jeong on 2022/05/04.
//

import XCTest
@testable import Lotto

class StringAdditionCaculatorTests: XCTestCase {

    let sut: StringAdditionCaculator = StringAdditionCaculator()
    
    func test_given음수_then에러가발생해야함() {
        //given
        let input: String = "-1"
        
        //when && then
        let expectation: StringAdditionError = StringAdditionError.negativeNumber
        XCTAssertThrowsError(try sut.caculate(input: input)) { error in
            XCTAssertEqual(error as? StringAdditionError, expectation)
        }    
    }
    
    func test_given문자_then에러가발생해야함() throws {
        //given
        let input: String = "무야호"
        
        //when && then
        let expectation: StringAdditionError = StringAdditionError.notNumber
        XCTAssertThrowsError(try sut.caculate(input: input)) { error in
            XCTAssertEqual(error as? StringAdditionError, expectation)
        }
    }
    
    func test_given공백문자열_then0값을_반환해야함() throws {
        //given
        let input: String = ""
        
        //when
        let result = try sut.caculate(input: input)
        //then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_given숫자문자열_when더하기_then숫자배열을_모두더한_합반환() throws {
        //given
        let input = "1,3,5"
        
        //when
        let result = try sut.caculate(input: input)
        
        //then
        let expectation: Int = 9
        XCTAssertEqual(result, expectation)
    }
    
    func test_given구분자가_두개들어간문자열_when더하기_then숫자배열을_모두더한_합반환() throws {
        //given
        let input = "1,3:5"
        
        //when
        let result = try sut.caculate(input: input)
        
        //then
        let expectation: Int = 9
        XCTAssertEqual(result, expectation)
    }
    
    func test_given문자내에허용되지않는구분자_when더하기_then에러발생() throws {
        //given
        let input: String = "1{,3,5"
        
        //when && then
        let expectation: StringAdditionError = StringAdditionError.notNumber
        XCTAssertThrowsError(try sut.caculate(input: input)) { error in
            XCTAssertEqual(error as? StringAdditionError, expectation)
        }
    }
    
    func test_given문자열_when구분자를기준으로나누기_then나뉜문자열배열반환() throws {
        //given
        let input = "1,3,5"
        
        //when
        let result = try sut.caculate(input: input)
        
        //then
        let expecation: Int = 9
        XCTAssertEqual(result, expecation)
    }

}
