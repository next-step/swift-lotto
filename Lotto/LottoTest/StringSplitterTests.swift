//
//  StringSplitterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class StringSplitterTests: XCTestCase {

    var sut: StringSplitter!
    
    override func setUpWithError() throws {
        sut = StringSplitter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_splitComponents_whenHasSingleSeparator() throws {
        //given
        let input: String = "1,2,3"
        let separators: CharacterSet = [","]
        
        // when
        let result: [String] = sut.split(input, by: separators)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenHasMultipleSeparators() throws {
        //given
        let input: String = "1,2:3"
        let separators: CharacterSet = [",", ":"]
        
        // when
        let result: [String] = sut.split(input, by: separators)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenInputDoesNotContainSeparator_equalToOriginalInput() throws {
        //given
        let input: String = "1,2,3"
        let separators: CharacterSet = [":"]
        
        // when
        let result: [String] = sut.split(input, by: separators)
        
        // then
        let expectation: [String] = ["1,2,3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenSeparatorsAreSuccessive_appendEmptyStringBetweenSeparators() throws {
        //given
        let input: String = "1,2,,3"
        let separators: CharacterSet = [","]
        
        // when
        let result: [String] = sut.split(input, by: separators)
        
        // then
        let expectation: [String] = ["1", "2", "", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenInputIsEmpty_equalToOriginalInput() throws {
        //given
        let input: String = ""
        let separators: CharacterSet = [","]
        
        // when
        let result: [String] = sut.split(input, by: separators)
        
        // then
        let expectation: [String] = [""]
        XCTAssertEqual(result, expectation)
    }

    func test_splitComponents_whenInputEndsWithSeparator_appendEmptyStringAsLastComponent() throws {
        //given
        let input: String = "1,2,3,"
        let separators: CharacterSet = [","]
        
        // when
        let result: [String] = sut.split(input, by: separators)
        
        // then
        let expectation: [String] = ["1", "2", "3", ""]
        XCTAssertEqual(result, expectation)
    }
}
