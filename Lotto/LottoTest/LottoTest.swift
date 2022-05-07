//
//  LottoTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/07.
//

import XCTest
@testable import Lotto

class LottoTest: XCTestCase {
    let stringCalculator = StringCalculator()
    
    func test_쉼표_콜론_숫자_구분_성공() {
        let value = "1,2"
        let expectedResult = [1,2]
        let splitResult = stringCalculator.split(value)
        XCTAssert(splitResult == expectedResult)
    }
    
    func test_빈값_결과_0() {
        let value = ""
        let expectedResult = [0]
        let splitResult = stringCalculator.split(value)
        let zeroIncludeReuslt = stringCalculator.emptyValueChangeZero(splitResult)
        XCTAssert(zeroIncludeReuslt == expectedResult)
    }
    
    func test_1쉼표2콜론3_합_결과6_성공() {
        let value = "1,2:3"
        let expectedResult = 6
        let splitResult = stringCalculator.split(value)
        let sumResult = stringCalculator.sum(splitResult)
        XCTAssert(sumResult == expectedResult)

    }
    
    func test_음수_입력시_에러_반환() {
        let value = "-1,2"
        let expectedResult = InputError.invalidNumber
        let splitResult = stringCalculator.split(value)
        let checkInvalidNumber = try stringCalculator.checkIncludeInvalidNumber(splitResult)
        XCTAssert(invalidNumber == expectedResult)

    }
    
    func test_문자_입력시_에러_반환() {
        let value = "f,3"
        let expectedResult = InputError.invalidNumber
        let splitResult = stringCalculator.split(value)
        let invalidNumber = try stringCalculator.checkIncludeInvalidNumber(splitResult)
        XCTAssert(invalidNumber == expectedResult)

    }
    

}
