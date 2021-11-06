//
//  StringAdditionCalcuatorTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/06.
//

import XCTest

class StringAdditionCalcuatorTest: XCTestCase {
	func test_shouldBeAnArrayOfNumbersWhenInputStringIsSplitted() throws {
		let inputs = "1,2:3"
		let calculator = Calculator()
		let result = calculator.split(inputs)
		XCTAssertEqual(result, ["1", "2", "3"])
	}
}

