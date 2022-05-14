//
//  StringCalculatorTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/07.
//

import XCTest
@testable import Lotto

class StringConverterTest: XCTestCase {
    let stringConverter = StringConverter()
    
    func test_1콤마2_입력시_결과_스트링배열_1과2_반환() {
        let value = "1,2"
        let expectedResult = ["1","2"]
        let result = stringConverter.split(value)
        XCTAssert(result == expectedResult)
    }
    
    func test_빈값_입력시_결과_스트링배열_0_반환() {
        let value = ""
        let expectedResult = ["0"]
        let splitStringArray = stringConverter.split(value)
        let result = stringConverter.emptyValueChangeZero(inputArray: splitStringArray)
        XCTAssert(result == expectedResult)
    }
    
    func test_nil_입력시_결과_스트링배열_0_반환() {
        let value: String? = nil
        let expectedResult = ["0"]
        let splitStringArray = stringConverter.split(value)
        let result = stringConverter.emptyValueChangeZero(inputArray: splitStringArray)
        XCTAssert(result == expectedResult)

    }
    
    func test_1쉼표2콜론3_입력시_결과_스트링배열_1과2와3_반환() {
        let value = "1,2:3"
        let expectedResult = ["1","2","3"]
        let result = stringConverter.split(value)
        XCTAssert(result == expectedResult)

    }

    func test_음수포함배열_입력시_결과_에러_반환() {
        let value = ["-1","2"]
        let expectedResult = InputError.invalidNumber
        do {
            let _ = try stringConverter.stringsToInts(input: value)
        } catch {
            if let error = error as? InputError {
                XCTAssert(expectedResult == error)
            }
        }

    }

    func test_문자포함배열_입력시_결과_에러_반환() {
        let value = ["f","3"]
        let expectedResult = InputError.invalidNumber
        do {
            let _ = try stringConverter.stringsToInts(input: value)
        } catch {
            if let error = error as? InputError {
                XCTAssert(expectedResult == error)
            }
        }
    }

}
