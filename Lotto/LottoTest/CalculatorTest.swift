//
//  CalculatorTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest

class CalculatorTest: XCTestCase {
    func test_Calculator_calculate() {
        // given
        let calculator = Calculator()
        let numbers = [1, 2, 3]
        
        // when
        let result = calculator.calculate(operands: numbers, operators: [Plus(), Plus()])
        
        // then
        XCTAssertEqual(result, 6)
    }
}
