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
}

// MARK: - input validation test

extension StringCalculatorTest {
    func test_input_string_validation_when_empty_return_0() {
        let inputString: String? = ""
        let result = try? calculator.plus(input: inputString)
        XCTAssertEqual(result, 0)
    }
    
    func test_input_string_validation_when_nil_return_0() {
        let inputString: String? = nil
        let result = try? calculator.plus(input: inputString)
        XCTAssertEqual(result, 0)
    }
    
    func test_input_string_validation_when_integer_count_1() {
        let inputString = "123"
        let result = try? calculator.plus(input: inputString)
        XCTAssertEqual(result, 123)
    }
    
    func test_input_string_validation_when_not_integer() {
        let inputString = "#1:2"
        XCTAssertThrowsError(try calculator.plus(input: inputString)) { error in
            guard let error = error as? CalcalatorInputError else {
                return
            }
            
            XCTAssertEqual(error, .notInteger)
        }
    }
    
    func test_input_string_validation_when_minus_integer() {
        let inputString = "-1:-2"
        XCTAssertThrowsError(try calculator.plus(input: inputString)) { error in
            guard let error = error as? CalcalatorInputError else {
                return
            }
            
            XCTAssertEqual(error, .minusInteger)
        }
    }
    
    func test_input_string_validation_when_minus_integer_count_1() {
        let inputString = "-1"
        XCTAssertThrowsError(try calculator.plus(input: inputString)) { error in
            guard let error = error as? CalcalatorInputError else {
                return
            }
            
            XCTAssertEqual(error, .minusInteger)
        }
    }
}

// MARK: - calculate plus test

extension StringCalculatorTest {
    func test_calculate_plus_integer() {
        let inputString = "1,2:3"
        let result = try? calculator.plus(input: inputString)
        XCTAssertEqual(result, 6)
    }
}
