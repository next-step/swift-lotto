//
//  LottoCountParserTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/20.
//

import XCTest
@testable import Lotto

class LottoCountParserTest: XCTestCase {

    func test_빈문자열로_parse시도시_에러를_throw한다() {
        // given
        let emptyString = ""
        
        // when
        // then
        XCTAssertThrowsError(try LottoCountParser.parse(emptyString), "빈문자열로_parse시도시_에러를_throw한다") { error in
            XCTAssert(error is LottoCountParser.Error)
            XCTAssertEqual(error.localizedDescription, LottoCountParser.Error.invalid.errorDescription)
        }
    }
    
    func test_양의정수String값이_아닌값으로_parse시도시_에러를_throw한다() {
        // given
        let invalidString = "-1"
        
        // when
        // then
        XCTAssertThrowsError(try LottoCountParser.parse(invalidString), "양의정수String값이_아닌값으로_parse시도시_에러를_throw한다") { error in
            XCTAssert(error is LottoCountParser.Error)
            XCTAssertEqual(error.localizedDescription, LottoCountParser.Error.invalid.errorDescription)
        }
    }
}
