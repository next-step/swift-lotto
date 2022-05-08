//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 이우섭 on 2022/05/08.
//

import XCTest

class CalculatorTest: XCTestCase {

    func test_입력값이_빈문자열일때_0을_반환() {
        let sut = StringCalculator()
        XCTAssertEqual(sut.calculate(with: ""), 0)
    }
    
    func test_입력값이_nil일때_0을_반환() {
        let sut = StringCalculator()
        XCTAssertEqual(sut.calculate(with: nil), 0)
    }

}
