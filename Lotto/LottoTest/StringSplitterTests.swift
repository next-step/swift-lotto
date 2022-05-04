//
//  StringCalculatorInputSplitterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class StringCalculatorInputSplitterTests: XCTestCase {

    var sut: StringCalculatorInputSplitter!
    
    override func setUpWithError() throws {
        sut = StringCalculatorInputSplitter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_splitComponents_whenHasSingleSeparator() throws {
        //given
        let input: String = "1,2,3"
        
        // when
        let result: [String] = sut.split(input)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenHasMultipleSeparators() throws {
        //given
        let input: String = "1,2:3"
        
        // when
        let result: [String] = sut.split(input)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenInputDoesNotContainSeparator_equalToOriginalInput() throws {
        //given
        let input: String = "123"
        
        // when
        let result: [String] = sut.split(input)
        
        // then
        let expectation: [String] = ["123"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenSeparatorsAreSuccessive_appendEmptyStringBetweenSeparators() throws {
        //given
        let input: String = "1,2,,3"
        
        // when
        let result: [String] = sut.split(input)
        
        // then
        let expectation: [String] = ["1", "2", "", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenInputIsEmpty_equalToOriginalInput() throws {
        //given
        let input: String = ""
        
        // when
        let result: [String] = sut.split(input)
        
        // then
        let expectation: [String] = [""]
        XCTAssertEqual(result, expectation)
    }

    func test_splitComponents_whenInputEndsWithSeparator_appendEmptyStringAsLastComponent() throws {
        //given
        let input: String = "1,2,3,"
        
        // when
        let result: [String] = sut.split(input)
        
        // then
        let expectation: [String] = ["1", "2", "3", ""]
        XCTAssertEqual(result, expectation)
    }
}
