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
        let splitter = Splitter(separaters: [Comma(), Colon()])
        let numberGenerator = PositiveNumberGenerator()
        inputParser = InputParser(splitter: splitter, numberGenerator: numberGenerator)
    }

    func test_parse_nil이_입력되면_0이_반환된다() {
        // given
        
        // when
        
        // then
    }
    
    func test_parse_빈문자열이_입력되면_0이_반환된다() {
        // given
        
        
        // when
        
        // then
    }
}
