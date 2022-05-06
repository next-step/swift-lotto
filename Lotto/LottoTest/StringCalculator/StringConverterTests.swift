//
//  StringConverterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/05.
//

import XCTest

class StringConverterTests: XCTestCase {

    var sut: StringConverter!
    
    override func setUpWithError() throws {
        sut = StringConverter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_convertToInt_whenInputIsIntString_equalToOriginalInputAsInt() throws {
        // given
        let input = "1"
        
        // when
        let result = try sut.convertToInt(from: input)
        
        // then
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToInt_whenInputIsDoubleString_throwError() throws {
        // given
        let input = "1.1"

        // when
        // then
        XCTAssertThrowsError(try sut.convertToInt(from: input))
    }
    
    func test_convertToInt_inputIsNotNumberString_throwError() throws {
        // given
        let input = "+"

        // when
        // then
        XCTAssertThrowsError(try sut.convertToInt(from: input))
    }
}

