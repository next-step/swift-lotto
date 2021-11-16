//
//  StringCalculatorTest.swift
//  LottoTest
//
//  Created by sangsun on 2021/11/17.
//

import XCTest

class StringCalculatorTest: XCTestCase {

    func test_빈문자열을_입력하면_0을_리턴한다() {
        let calculator = StringCalculator()
        let result = calculator.processingString(by: "")
        XCTAssertEqual(result, 0)
        
        let result1 = calculator.processingString(by: "1")
        XCTAssertNotEqual(result1, 0)
    }
    
    func test_숫자하나만_문자열로_입력하면_해당_숫자를_리턴한다() {
        let calculator = StringCalculator()
        let result = calculator.processingString(by: "1")
        XCTAssertEqual(result, 1)
        
        let result1 = calculator.processingString(by: "2")
        XCTAssertEqual(result1, 2)
    }
}
