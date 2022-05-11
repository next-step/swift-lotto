//
//  LottoTests.swift
//  LottoTests
//
//  Created by 송유찬 on 2022/05/07.
//

import XCTest

class LottoTests: XCTestCase {
    
    func test_다섯자리_로또_에러_검증() throws {
        // given
        let count = 5
        
        // when, then
        XCTAssertThrowsError(try LottoNumbers(numbers: Array(1...count)))
    }
    
    func test_여섯자리_로또_에러_검증() throws {
        // given
        let count = 6
        
        // when, then
        XCTAssertNoThrow(try LottoNumbers(numbers: Array(1...count)))
    }
    
    func test_일곱자리_로또_에러_검증() throws {
        // given
        let count = 7
        
        // when, then
        XCTAssertThrowsError(try LottoNumbers(numbers: Array(1...count)))
    }

    func test_로또_한번_자동생성() throws {
        // given
        let targetCount = 1

        // when, then
        let generator = LottoGenerator()
        XCTAssertNoThrow(try generator.auto(n: targetCount))
    }
    
    func test_로또_세번_자동생성() throws {
        // given
        let targetCount = 3
        let generator = LottoGenerator()
        let lottos = try generator.auto(n: targetCount)
        
        // when
        let count = lottos.count

        // then
        XCTAssertEqual(targetCount, count)
    }

}
