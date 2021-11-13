//
//  StringCalculatorTest.swift
//  StringCalculatorTest
//
//  Created by 남기범 on 2021/11/13.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTest: XCTestCase {
    var calculator: StringCalculator!

    override func setUpWithError() throws {
        calculator = StringCalculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }
    
    func test_input_string_validation_when_empty_return_0() {
        let inputString: String? = ""
        let result = calculator.plus(input: inputString)
        XCTAssertEqual(result, 0)
    }
    
    func test_input_string_validation_when_nil_return_0() {
        let inputString: String? = nil
        let result = calculator.plus(input: inputString)
        XCTAssertEqual(result, 0)
    }
    
    func test_input_string_validation_when_integer_count_1() {
        let inputString = "123"
        let result = calculator.plus(input: inputString)
        XCTAssertEqual(result, 123)
    }
}
