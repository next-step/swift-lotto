//
//  LottoTest.swift
//  LottoTest
//
//  Created by 이우섭 on 2022/05/17.
//

import XCTest

class LottoTest: XCTestCase {
    
    func test_10000원을_주면_로또_10장을_반환() {
        let sut = LottoCustomer()
        sut.buyLotto(for: 10000)
        XCTAssertEqual(sut.lottos.count, 10)
    }

}
