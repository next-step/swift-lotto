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
    }
}
