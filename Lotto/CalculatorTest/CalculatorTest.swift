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
        XCTAssertEqual(sut.calculate(with: ""), 0)
    }
    
    func test_입력값이_nil일때_0을_반환() {
        XCTAssertEqual(sut.calculate(with: nil), 0)
    }
    
    func test_숫자가_하나뿐일때_그_수를_반환() {
        XCTAssertEqual(sut.calculate(with: "9"), 9)
    }
    
    func test_숫자_사이를_컴마로_입력하면_수의_합을_반환() {
        XCTAssertEqual(sut.calculate(with: "1,9"), 10)
    }
    
    func test_숫자_사이를_콜론으로_입력하면_수의_합을_반환() {
        XCTAssertEqual(sut.calculate(with: "1:9"), 10)
    }
    
    func test_숫자_사이를_컴마와_콜론으로_입력하면_수의_합을_반환() {
        XCTAssertEqual(sut.calculate(with: "1,4:5"), 10)
    }
    
    func test_주어진_숫자중_음수가_존재하면_오류반환() {
        XCTAssertThrowsError(try sut.calculate(with: "-1,5,6"))
    }

}
