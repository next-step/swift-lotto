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
        let defaultlottoCount = Constants.defaultLottoCount
        
        let generator = LottoGenerator()
        let lotto = generator.autoNumbers()
        let validNumbers: Set<Int> = Set(lotto.numbers)
        
        // when
        let lottoCount = validNumbers.count
        
        // then
        XCTAssertEqual(defaultlottoCount, lottoCount)
    }
    
    func test_로또_세번_자동생성() {
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
