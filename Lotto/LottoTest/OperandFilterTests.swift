//
//  OperandFilterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class OperandFilterTests: XCTestCase {

    var sut: OperandFilter!
    
    override func setUpWithError() throws {
        sut = OperandFilter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_filteredOperands_whenHasSingleSeparator() throws {
        //given
        let input: String = "1,2,3"
        let separators: CharacterSet = [","]
        
        // when
        let result: [Int] = try sut.filter(from: input,
                                           separatedBy: separators)
        
        // then
        let expectation: [Int] = [1,2,3]
        XCTAssertEqual(result, expectation)
    }
    
    func test_filteredOperands_whenHasMultipleSeparators() throws {
        //given
        let input: String = "1,2:3"
        let separators: CharacterSet = [",", ":"]
        
        // when
        let result: [Int] = try sut.filter(from: input,
                                           separatedBy: separators)
        
        // then
        let expectation: [Int] = [1,2,3]
        XCTAssertEqual(result, expectation)
    }

    func test_filteredOperands_whenInputDoesNotContainSeparator_equalToOriginalInputAsInt() throws {
        //given
        let input: String = "123"
        let separators: CharacterSet = []

        // when
        let result: [Int] = try sut.filter(from: input,
                                           separatedBy: separators)

        // then
        let expectation: [Int] = [123]
        XCTAssertEqual(result, expectation)
    }

    func test_filteredOperands_whenSeparatorsAreSuccessive_throwError() throws {
        //given
        let input: String = "1,2,,3"
        let separators: CharacterSet = [","]

        // when
        // then
        XCTAssertThrowsError(try sut.filter(from: input,
                                            separatedBy: separators))
    }

    func test_splitComponents_whenInputIsEmpty_throwError() throws {
        //given
        let input: String = ""
        let separators: CharacterSet = [","]
        
        // when
        // then
        XCTAssertThrowsError(try sut.filter(from: input,
                                            separatedBy: separators))
    }

    func test_splitComponents_whenInputEndsWithSeparator_throwError() throws {
        //given
        let input: String = "1,2,3,"
        let separators: CharacterSet = [","]

        // when
        // then
        XCTAssertThrowsError(try sut.filter(from: input,
                                            separatedBy: separators))
    }
}
