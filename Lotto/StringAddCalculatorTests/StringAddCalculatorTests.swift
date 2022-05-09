//
//  StringAddCalculatorTests.swift
//  StringAddCalculatorTests
//
//  Created by YooBin Jo on 2022/05/06.
//

import XCTest

class StringAddCalculatorTests: XCTestCase {
    
    func test_숫자_배열이_주어졌을_때_덧셈이_잘_동작한다 () {
        let input: [Int] = [1, 2, 3]
        let operate: Int = Calculator.add(input)
        let output: Int = 6
        XCTAssert(operate == output,
                  "숫자 배열에 따른 덧셈 결과가 틀립니다.")
    }
}
