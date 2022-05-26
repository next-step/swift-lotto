//
//  LottoCountTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/20.
//

import XCTest

class LottoCountTest: XCTestCase {
    func test_0이상의값을_갖는다() {
        XCTAssertNotNil(LottoCount(0))
    }

    func test_음수가_intializer에_들어오면_nil을_반환한다() {
        XCTAssertNil(LottoCount(-1))
    }
}
