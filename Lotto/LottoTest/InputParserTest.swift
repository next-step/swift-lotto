//
//  InputParserTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest

class InputParserTest: XCTestCase {
    var inputParser: InputParser!
    
    override func setUpWithError() throws {
        let separators = Separators(value: [Comma(), Colon()])
        let splitter = Splitter(separaters: separators)
        inputParser = InputParser(splitter: splitter, numberGenerator: PositiveNumberGenerator.self)
    }

    func test_parse_nil이_입력되면_0이담긴배열이_반환된다() {
        // given
        let nilString: String? = nil
        
        // when
        let result = try! inputParser.parse(input: nilString)
        
        // then
        XCTAssertEqual(result, [0])
    }
    
    func test_parse_빈문자열이_입력되면_0이담긴배열이_반환된다() {
        // given
        let emptyString = ""
        
        // when
        let result = try! inputParser.parse(input: emptyString)
        
        // then
        XCTAssertEqual(result, [0])
    }
}
