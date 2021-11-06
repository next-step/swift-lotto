//
//  StringAdditionCalcuatorTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/06.
//

import XCTest

class StringAdditionCalcuatorTest: XCTestCase {
	let calculator = Calculator()
	func test_shouldBeAnArrayOfNumbersWhenInputStringIsSplitted() throws {
		let input = "1,2:3"
		let results = calculator.split(input)
		XCTAssertEqual(results, ["1", "2", "3"])
	}
	
	func test_shouldReturn10WhenAddingInputValues6And4() throws {
		let input = "6,4"
		let results = try calculator.add(input)
		XCTAssertEqual(results, 10)
	}
	
	func test_shouldReturn0WhenInputValueIsNilOrEmpty() throws {
		XCTAssertEqual(0, try calculator.add(""))
		XCTAssertEqual(0, try calculator.add(nil))
	}
}

