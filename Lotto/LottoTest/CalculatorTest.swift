//
//  CalculatorTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/08.
//

import XCTest
@testable import Lotto

class CalculatorTest: XCTestCase {
    let calculator = Calculator()
    
    func test_인트배열_1과2와3_입력시_결과_6_반환() {
        let value = [1,2,3]
        let expectedResult = 6
        let result = calculator.sum(value)
        XCTAssert(result == expectedResult)
    }

}
