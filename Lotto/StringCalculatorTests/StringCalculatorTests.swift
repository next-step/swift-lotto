//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by ycsong on 2022/05/04.
//

import XCTest

class StringCalculatorTests: XCTestCase {
    
    func test_nil값이_0을_리턴하는지_검증() throws {
        // given
        let input: String? = nil
        
        // when
        let result: Int = try Validator.validNumber(from: input)
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_빈값이_0을_리턴하는지_검증() throws {
        // given
        let input: String? = ""
        
        // when
        let result: Int = try Validator.validNumber(from: input)
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_숫자_아닌값_검증() throws {
        // given
        let input: String? = "A"
        
        // when, then
        let _: Int = try Validator.validNumber(from: input)
    }
    
}
