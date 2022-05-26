//
//  CustomLottoTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/19.
//

import XCTest
@testable import Lotto

class CustomLottoTest: XCTestCase {
    func test_CustomLotto_6개의_숫자를_받으면_nil을_반환하지않고_정상적으로_생성된다() {
        XCTAssertNotNil(CustomLotto(numbers: [1, 2, 3, 4, 5, 6]))
    }

    func test_CustomLotto_중복되지_않는_6개의_숫자를_받지않으면_nil을_반환한다() {
        XCTAssertNil(CustomLotto(numbers: [1, 2, 3, 4, 5, 5]))
    }
}
