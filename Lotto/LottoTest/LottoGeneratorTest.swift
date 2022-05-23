//
//  LottoGeneratorTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/18.
//

import XCTest

class LottoGeneratorTest: XCTestCase {
    let lottoGenerator = LottoGenerator()
        
    func test_로또5개_생성() {
        let lottos = lottoGenerator.generate(count: 5)
        let expectedCount = 5
        XCTAssert(lottos.count == expectedCount, "로또 5개 생성 오류")
    }
    
    func test_로또0개_생성시_빈값() {
        let lottos = lottoGenerator.generate(count: 0)
        let expectedCount = 0
        XCTAssert(lottos.count == expectedCount, "로또 0개 생성 오류")
    }
    
    func test_로또음수개_생성시_빈값() {
        let lottos = lottoGenerator.generate(count: -3)
        let expectedCount = 0
        XCTAssert(lottos.count == expectedCount, "로또 -3개 생성 오류")
    }
}
