//
//  ValidatorTests.swift
//  StringAddCalculatorTests
//
//  Created by YooBin Jo on 2022/05/06.
//

import XCTest

class ValidatorTests: XCTestCase {
    
    func test_주어진_값이_숫자인지_잘_판단한다() throws {
        let input: String = "1"
        let operate: Void = try Validator.check(input)
        XCTAssertNoThrow(operate,
                         "숫자가 아닙니다")
    }
    
    func test_주어진_값에_음수가_있다면_에러를_발생시킨다() throws {
        let input: String = "-1"
        let operate: Void = try Validator.check(input)
        XCTAssertThrowsError(operate,
                             "숫자가 아닙니다") { error in
            guard let error = error as? Validator.Errors else {
                fatalError("ValidatorError가 발생한 것이 아닙니다.")
            }
            XCTAssertEqual(error,
                           Validator.Errors.negativeNumber,
                           "negativeNumber error가 아닙니다.")
        }
    }
    
    func test_주어진_값에_숫자가_아닌_문자가_있다면_에러를_발생시킨다() throws {
        let input: String = "a"
        let operate: Void = try Validator.check(input)
        XCTAssertThrowsError(operate,
                             "숫자가 아닙니다") { error in
            guard let error = error as? Validator.Errors else {
                fatalError("ValidatorError가 발생한 것이 아닙니다.")
            }
            XCTAssertEqual(error,
                           Validator.Errors.invalidNumber,
                           "negativeNumber error가 아닙니다.")
        }
    }
}
