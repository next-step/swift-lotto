//
//  StringAdditionCalcuatorTest.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/06.
//

import XCTest

class StringAdditionCalcuatorTest: XCTestCase {
	let calculator = Calculator()
	func test_shouldReturn10WhenAddingInputValues6And4() throws {
		let input = "6,4"
		let results = try calculator.add(input)
		XCTAssertEqual(results, 10)
	}
	
	func test_shouldReturn0WhenInputValueIsNilOrEmpty() throws {
		XCTAssertEqual(0, try calculator.add(""))
		XCTAssertEqual(0, try calculator.add(nil))
	}
	
	func test_shouldThrowInvalidErrorWhenInputIsContainedNegativeNumber() {
		let input = "-1,10:5"
		XCTAssertThrowsError(try calculator.add(input)) { error in
			XCTAssertEqual(error as! ValueError, .invalid)
		}
	}
	
	func test_shouldThrowInvalidErrorWhenInputIsContainedAnyOtherCharacters() {
		XCTAssertThrowsError(try calculator.add("!10,5")) { error in
			XCTAssertEqual(error as! ValueError, .invalid)
		}
		
		XCTAssertThrowsError(try calculator.add("!#1^&")) { error in
			XCTAssertEqual(error as! ValueError, .invalid)
		}
		
		XCTAssertThrowsError(try calculator.add("#")) { error in
			XCTAssertEqual(error as! ValueError, .invalid)
		}
		
		XCTAssertThrowsError(try calculator.add("3#5")) { error in
			XCTAssertEqual(error as! ValueError, .invalid)
		}
	}
	
	func test_shouldReturn0WhenInputValueIsOnlyAColonOrComma() {
		XCTAssertEqual(0, try calculator.add(","))
		XCTAssertEqual(0, try calculator.add(":"))
	}
	
	func test_shouldReturn55WhenAddingInputValuesFrom1to10() throws {
		let input = "1,2:3,4:5,6:7:8:9:10"
		let results = try calculator.add(input)
		XCTAssertEqual(results, 55)
	}
}

