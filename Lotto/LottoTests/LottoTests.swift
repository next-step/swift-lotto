//
//  LottoTests.swift
//  LottoTests
//
//  Created by 송유찬 on 2022/05/07.
//

import XCTest

class LottoTests: XCTestCase {
    
    func test_로또번호_0_유효성_검증() throws {
        // given
        let number = 0
        
        // when, then
        XCTAssertThrowsError(try LottoNumber(number))
    }
    
    func test_로또번호_10_유효성_검증() throws {
        // given
        let number = 10
        
        // when, then
        XCTAssertNoThrow(try LottoNumber(number))
    }
    
    func test_로또번호_46_유효성_검증() throws {
        // given
        let number = 46
        
        // when, then
        XCTAssertThrowsError(try LottoNumber(number))
    }
    
    func test_로또번호_중복없는_여섯자리인지_검증() throws {
        // given
        let lottoNumbers = [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ]
        
        // when, then
        XCTAssertNoThrow(try LottoNumbers(numbers: lottoNumbers))
    }
    
    func test_매치() throws {
        // given
        let lottoNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let matchingCount = lottoNumbers.matchCount(from: winningNumbers)
        let result = Match(matchingCount: matchingCount)
        print("result: \(result.reward)")
    }
    
//    func test_다섯자리_로또_에러_검증() throws {
//        // given
//        let count = 5
//
//        // when, then
//        XCTAssertThrowsError(try LottoNumbers(numbers: Array(1...count)))
//    }
//
//    func test_여섯자리_로또_에러_검증() throws {
//        // given
//        let count = 6
//
//        // when, then
//        XCTAssertNoThrow(try LottoNumbers(numbers: Array(1...count)))
//    }
//
//    func test_일곱자리_로또_에러_검증() throws {
//        // given
//        let count = 7
//
//        // when, then
//        XCTAssertThrowsError(try LottoNumbers(numbers: Array(1...count)))
//    }
//
//    func test_로또_한번_자동생성() throws {
//        // given
//        let targetCount = 1
//
//        // when, then
//        let generator = LottoGenerator()
//        XCTAssertNoThrow(try generator.auto(n: targetCount))
//    }
//
//    func test_로또_세번_자동생성() throws {
//        // given
//        let targetCount = 3
//        let generator = LottoGenerator()
//        let lottos = try generator.auto(n: targetCount)
//
//        // when
//        let count = lottos.count
//
//        // then
//        XCTAssertEqual(targetCount, count)
//    }

}
