//
//  OperatorTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest
@testable import Lotto

class OperatorTest: XCTestCase {
    func test_plus_덧셈_연산자는_두정수를_더한값을_반환한다() {
        // given
        let plus = Plus()
        
        // when
        let result = plus.operate(1, 2)
        
        // then
        XCTAssertEqual(result, 3)
    }
}
