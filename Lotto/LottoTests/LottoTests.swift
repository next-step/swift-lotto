//
//  LottoTests.swift
//  LottoTests
//
//  Created by 송유찬 on 2022/05/07.
//

import XCTest

class LottoTests: XCTestCase {

    func test_로또_여섯자리_중복없이_자동생성() {
        // given
        let lottoCount = Constants.defaultLottoCount
        
        // when
        let generator = LottoGenerator()
        let lotto = generator.autoNumbers()
        
        let validNumbers: Set<Int> = Set(lotto.numbers)
        let count = validNumbers.count
        
        // then
        XCTAssertEqual(lottoCount, count)
    }
    
    func test_로또_n번_자동생성() {
        // given
        let n = 3
        
        // when
        let generator = LottoGenerator()
        let lottos = generator.auto(n: n)
        let count = lottos.count
        
        // then
        XCTAssertEqual(n, count)
    }

}
