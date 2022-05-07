//
//  ValidatorTests.swift
//  StringAddCalculatorTests
//
//  Created by YooBin Jo on 2022/05/06.
//

import XCTest

class ValidatorTests: XCTestCase {
    
    func test_주어진_값이_숫자인지_잘_판단한다() throws {
        XCTAssertNoThrow(try Validator.check("1") == true,
                         "숫자가 아닙니다")
    }
    
    func test_주어진_값에_음수가_있다면_에러를_발생시킨다() throws {
        XCTAssertThrowsError(try Validator.check("-1") == true,
                             "숫자가 아닙니다") { error in
            guard let error = error as? Validator.ValidatorError else {
                fatalError("ValidatorError가 발생한 것이 아닙니다.")
            }
            XCTAssertEqual(error,
                           Validator.ValidatorError.negativeNumber,
                           "negativeNumber error가 아닙니다.")
        }
    }
    
    func test_주어진_값에_숫자가_아닌_문자가_있다면_에러를_발생시킨다() throws {
        XCTAssertThrowsError(try Validator.check("a") == true,
                             "숫자가 아닙니다") { error in
            guard let error = error as? Validator.ValidatorError else {
                fatalError("ValidatorError가 발생한 것이 아닙니다.")
            }
            XCTAssertEqual(error,
                           Validator.ValidatorError.invalidNumber,
                           "negativeNumber error가 아닙니다.")
        }
    }
}
