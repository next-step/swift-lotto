//
//  MoneyParserTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/10.
//

import XCTest
@testable import Lotto

class MoneyParserTest: XCTestCase {

    func test_parse_nil이_입력되면_에러를_발생시킨다() {
        // given
        let nilInput: String? = nil

        // when
        XCTAssertThrowsError(try MoneyParser.parse(money: nilInput), "nil이_입력되면_에러를_발생시킨다") { error in
            XCTAssert(error is MoneyParser.Error)
            XCTAssert(error.localizedDescription ==  MoneyParser.Error.invalidInput(nilInput).errorDescription)
        }
    }
}
