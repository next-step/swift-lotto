//
//  SplitterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/05.
//

import XCTest

class SplitterTests: XCTestCase {

    var sut: Splitter!
    
    override func setUpWithError() throws {
        let colon = ":"
        let comma = ","
        sut = Splitter(separators: [colon, comma])
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_splitComponents_whenHasSingleCommaSeparator() throws {
        //given
        let input: String = "1,2,3"
        
        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenHasSingleColonSeparator() throws {
        //given
        let input: String = "1:2:3"
        
        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenHasBothCommaAndColonSeparators() throws {
        //given
        let input: String = "1,2:3"
        
        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = ["1", "2", "3"]
        XCTAssertEqual(result, expectation)
    }

    func test_splitComponents_whenInputDoesNotContainCommnaNorColon_equalToOriginalInput() throws {
        //given
        let input: String = "123"

        // when
        let result: [String] = sut.components(of: input)

        // then
        let expectation: [String] = ["123"]
        XCTAssertEqual(result, expectation)
    }

    func test_splitComponents_whenInputIsEmpty_equalToOriginalInput() throws {
        //given
        let input: String = ""
        
        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = [""]
        XCTAssertEqual(result, expectation)
    }

    func test_splitComponents_whenInputIsSpace_equalToOriginalInput() throws {
        //given
        let input: String = " "
        
        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = [" "]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitComponents_whenSeparatorsAreSuccessive_appendEmptyStringBetweenSeparators() throws {
        //given
        let input: String = "1,2,,3"

        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = ["1", "2", "", "3"]
        XCTAssertEqual(result, expectation)
    }


    func test_splitComponents_whenInputEndsWithSeparator_appendEmptyStringAsLastComponent() throws {
        //given
        let input: String = "1,2,3,"

        // when
        let result: [String] = sut.components(of: input)
        
        // then
        let expectation: [String] = ["1", "2", "3", ""]
        XCTAssertEqual(result, expectation)
    }
}
