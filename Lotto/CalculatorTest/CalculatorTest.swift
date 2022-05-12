//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 이우섭 on 2022/05/08.
//

import XCTest

class CalculatorTest: XCTestCase {
    
    let sut = StringCalculator()

    func test_입력값이_빈문자열일때_0을_반환() {
        let formula: String? = ""
        let expected: Int = 0
        XCTAssertEqual(try sut.calculate(with: formula), expected)
    }
    
    func test_입력값이_nil일때_0을_반환() {
        let formula: String? = nil
        let expected: Int = 0
        XCTAssertEqual(try sut.calculate(with: formula), expected)
    }
    
    func test_숫자가_하나뿐일때_그_수를_반환() {
        let formula: String? = "9"
        let expected: Int = 9
        XCTAssertEqual(try sut.calculate(with: formula), expected)
    }
    
    func test_숫자_사이를_컴마로_입력하면_수의_합을_반환() {
        let formula: String? = "1,9"
        let expected: Int = 10
        XCTAssertEqual(try sut.calculate(with: formula), expected)
    }
    
    func test_숫자_사이를_콜론으로_입력하면_수의_합을_반환() {
        let formula: String? = "1:9"
        let expected: Int = 10
        XCTAssertEqual(try sut.calculate(with: formula), expected)
    }
    
    func test_숫자_사이를_컴마와_콜론으로_입력하면_수의_합을_반환() {
        let formula: String? = "1,4:5"
        let expected: Int = 10
        XCTAssertEqual(try sut.calculate(with: formula), expected)
    }
    
    func test_주어진_숫자중_음수가_존재하면_오류반환() {
        let formula: String? = "-1,5,6"
        XCTAssertThrowsError(try sut.calculate(with: formula))
    }
    
    func test_숫자이외의_값이_주어지면_오류반환() {
        let formula = "@"
        XCTAssertThrowsError(try sut.calculate(with: formula))
    }

}
