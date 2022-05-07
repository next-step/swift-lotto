//
//  NumberGeneratorTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest
@testable import Lotto

class NumberGeneratorTest: XCTestCase {
    func test_PositiveNumberGenerater_양의정수문자열가_입력되는경우_Int타입의양의정수가_반환된다() {
        // given
        let positiveNumber = "123"
        
        // when
        let result = try! PositiveNumberGenerator.from(positiveNumber)
        
        // then
        XCTAssertEqual(result, Int(positiveNumber)!)
    }
    
    func test_PositiveNumberGenerater_숫자이외의값이_입력되는경우_isNotNumber에러를_throw한다() {
        // given
        let input = "*"
        
        // when
        // then
        XCTAssertThrowsError(try PositiveNumberGenerator.from(input), "숫자 이외의 값은 에러를 반환한다.") { error in
            XCTAssert(error is PositiveNumberGenerator.Error)
            XCTAssert(error.localizedDescription == PositiveNumberGenerator.Error.isNotNumber(input).errorDescription)
        }
    }
    
    func test_PositiveNumberGenerater_음수가_입력되는경우_isNegativeNumber에러를_throw한다() {
        // given
        let negativeNumber = "-1"
        
        // when
        // then
        XCTAssertThrowsError(try PositiveNumberGenerator.from(negativeNumber), "음수가 입력되는 경우 isNegativeNumber에러를 throw한다") { error in
            XCTAssert(error is PositiveNumberGenerator.Error)
            XCTAssert(error.localizedDescription == PositiveNumberGenerator.Error.isNegativeNumber(
                Int(negativeNumber)!).errorDescription)
        }
    }
    
    func test_PositiveNumberGenerator_빈문자열은_0으로_변환한다() {
        // given
        let emptyString = ""
        
        // when
        let result = try! PositiveNumberGenerator.from(emptyString)
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_PositiveNumberGenerator_nil은_0으로_변환한다() {
        // given
        let nilString: String? = nil
        
        // when
        let result = try! PositiveNumberGenerator.from(nilString)
        
        // then
        XCTAssertEqual(result, 0)
    }
}
