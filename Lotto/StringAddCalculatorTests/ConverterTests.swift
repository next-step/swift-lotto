//
//  ConverterTests.swift
//  StringAddCalculatorTests
//
//  Created by YooBin Jo on 2022/05/07.
//

import XCTest

class ConverterTests: XCTestCase {

    func test_문자로된_숫자_배열이_정수형으로_잘_변환된다() throws {
        let input: [String] = ["1", "2", "3"]
        let operate: [Int] = try Converter.convert(input)
        let output: [Int] = [1, 2, 3]
        XCTAssertEqual(operate,
                       output,
                       "숫자 변환이 정상적으로 이뤄지지 않았습니다.")
    }
}
