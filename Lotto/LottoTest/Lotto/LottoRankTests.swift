//
//  LottoRankTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/08.
//

import XCTest

class LottoRankTests: XCTestCase {

    var sut: LottoRank.Type!
    
    override func setUpWithError() throws {
        sut = LottoRank.self
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
   
    func test_rank_sixNumberAreEqualToTheWinningNumbers_eqaulToFirst() throws {
        //given
        let matchNumberCount = 6
        
        // when
        let result = sut.rank(matchNumberCount: matchNumberCount)
        
        // then
        let expectation: LottoRank = .first
        XCTAssertEqual(result, expectation)
    }
    
    func test_rank_fiveNumberAreEqualToTheWinningNumbersAndMatchBonusNumber_eqaulToSecond() throws {
        //given
        let matchNumberCount = 5
        
        // when
        let result = sut.rank(matchNumberCount: matchNumberCount, isMatchBonus: true)
        
        // then
        let expectation: LottoRank = .second
        XCTAssertEqual(result, expectation)
    }
    
    func test_rank_fiveNumberAreEqualToTheWinningNumbersAndNoMatchBonusNumber_eqaulToThird() throws {
        //given
        let matchNumberCount = 5
        
        // when
        let result = sut.rank(matchNumberCount: matchNumberCount)
        
        // then
        let expectation: LottoRank = .third
        XCTAssertEqual(result, expectation)
    }
    
    func test_rank_foutNumberAreEqualToTheWinningNumbers_eqaulToForth() throws {
        //given
        let matchNumberCount = 4
        
        // when
        let result = sut.rank(matchNumberCount: matchNumberCount)
        
        // then
        let expectation: LottoRank = .forth
        XCTAssertEqual(result, expectation)
    }
    
    func test_rank_threeNumberAreEqualToTheWinningNumbers_eqaulToFifth() throws {
        //given
        let matchNumberCount = 3
        
        // when
        let result = sut.rank(matchNumberCount: matchNumberCount)
        
        // then
        let expectation: LottoRank = .fifth
        XCTAssertEqual(result, expectation)
    }
    
    func test_matchNumberCount_whenFirstRank_eqaulToSix() throws {
        //given
        let lottoRank = LottoRank.first
        
        // when
        let result = lottoRank.matchNumberCount
        
        // then
        let expectation: Int = 6
        XCTAssertEqual(result, expectation)
    }
    
    func test_matchNumberCount_whenSecondRank_eqaulToFive() throws {
        //given
        let lottoRank = LottoRank.second
        
        // when
        let result = lottoRank.matchNumberCount
        
        // then
        let expectation: Int = 5
        XCTAssertEqual(result, expectation)
    }
    
    func test_matchNumberCount_whenThirdRank_eqaulToFive() throws {
        //given
        let lottoRank = LottoRank.third
        
        // when
        let result = lottoRank.matchNumberCount
        
        // then
        let expectation: Int = 5
        XCTAssertEqual(result, expectation)
    }
    
    func test_matchNumberCount_whenForthRank_eqaulToFour() throws {
        //given
        let lottoRank = LottoRank.forth
        
        // when
        let result = lottoRank.matchNumberCount
        
        // then
        let expectation: Int = 4
        XCTAssertEqual(result, expectation)
    }
    
    func test_matchNumberCount_whenFifthRank_eqaulToThree() throws {
        //given
        let lottoRank = LottoRank.fifth
        
        // when
        let result = lottoRank.matchNumberCount
        
        // then
        let expectation: Int = 3
        XCTAssertEqual(result, expectation)
    }
    
    func test_matchNumberCount_whenNoneRank_eqaulToZero() throws {
        //given
        let lottoRank = LottoRank.none
        
        // when
        let result = lottoRank.matchNumberCount
        
        // then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_prizeMoney_whenFirstRank_eqaulTo_2_000_000_000() throws {
        //given
        let lottoRank = LottoRank.first
        
        // when
        let result = lottoRank.prizeMoney
        
        // then
        let expectation: Int = 2_000_000_000
        XCTAssertEqual(result, expectation)
    }
    
    func test_prizeMoney_whenSecondRank_eqaulTo_30_000_000() throws {
        //given
        let lottoRank = LottoRank.second
        
        // when
        let result = lottoRank.prizeMoney
        
        // then
        let expectation: Int = 30_000_000
        XCTAssertEqual(result, expectation)
    }
    
    func test_prizeMoney_whenThirdRank_eqaulTo_1_500_000() throws {
        //given
        let lottoRank = LottoRank.third
        
        // when
        let result = lottoRank.prizeMoney
        
        // then
        let expectation: Int = 1_500_000
        XCTAssertEqual(result, expectation)
    }
    
    func test_prizeMoney_whenForthRank_eqaulToFour_50_000() throws {
        //given
        let lottoRank = LottoRank.forth
        
        // when
        let result = lottoRank.prizeMoney
        
        // then
        let expectation: Int = 50_000
        XCTAssertEqual(result, expectation)
    }
    
    func test_prizeMoney_whenFifthRank_eqaulTo_5_000() throws {
        //given
        let lottoRank = LottoRank.fifth
        
        // when
        let result = lottoRank.prizeMoney
        
        // then
        let expectation: Int = 5_000
        XCTAssertEqual(result, expectation)
    }
    
    func test_prizeMoney_whenNoneRank_eqaulTo_0() throws {
        //given
        let lottoRank = LottoRank.none
        
        // when
        let result = lottoRank.prizeMoney
        
        // then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
}
