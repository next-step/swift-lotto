//
//  LottoResultTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/07.
//

import XCTest

class LottoResultTests: XCTestCase {
    
    var lottoRankChecker: LottoRankChecker!
    var firstWinningNumbers: [Int]!
    var secondWinningNumbers: [Int]!
    var thirdWinningNumbers: [Int]!
    var forthWinningNumbers: [Int]!
    var noneWinningNumbers: [Int]!
    
    override func setUpWithError() throws {
        let winningNumbers = [1,2,3,4,5,6]
        lottoRankChecker = try LottoRankChecker(winningNumbers: winningNumbers)
        
        firstWinningNumbers = [1,2,3,4,5,6]
        secondWinningNumbers = [1,2,3,4,5,7]
        thirdWinningNumbers = [1,2,3,4,7,8]
        forthWinningNumbers = [1,2,3,7,8,9]
        noneWinningNumbers = [1,2,7,8,9,10]
    }
    
    override func tearDownWithError() throws {
        lottoRankChecker = nil
        firstWinningNumbers = nil
        secondWinningNumbers = nil
        thirdWinningNumbers = nil
        forthWinningNumbers = nil
        noneWinningNumbers = nil
    }
    
    func test_winningCount_whenGetEachWinningOnce() throws {
        //given
        let lottos: [Lotto] = [firstWinningNumbers,
                               secondWinningNumbers,
                               thirdWinningNumbers,
                               forthWinningNumbers]
            .map(Lotto.init)
        
        let sut = LottoResult(lottos: lottos,
                              lottoRankChecker: lottoRankChecker)
        
        // when
        // then
        XCTAssertEqual(sut.winningCount(for: .first), 1)
        XCTAssertEqual(sut.winningCount(for: .second), 1)
        XCTAssertEqual(sut.winningCount(for: .third), 1)
        XCTAssertEqual(sut.winningCount(for: .forth), 1)
    }
    
    func test_winningCount_whenGetOnceFirstWinning() throws {
        //given
        
        let lottos: [Lotto] = [firstWinningNumbers]
            .map(Lotto.init)
        
        let sut = LottoResult(lottos: lottos,
                              lottoRankChecker: lottoRankChecker)
        
        // when
        // then
        XCTAssertEqual(sut.winningCount(for: .first), 1)
        XCTAssertEqual(sut.winningCount(for: .second), 0)
        XCTAssertEqual(sut.winningCount(for: .third), 0)
        XCTAssertEqual(sut.winningCount(for: .forth), 0)
    }
    
    func test_winningCount_whenContainsBothValidAndInValidLotto_countValidLotto() throws {
        //given
        let invalidLottoNumbers = [46]
        let lottos: [Lotto] = [firstWinningNumbers,
                               invalidLottoNumbers]
            .map(Lotto.init)
        
        let sut = LottoResult(lottos: lottos,
                              lottoRankChecker: lottoRankChecker)
     
        // when
        let firstWinningCount = sut.winningCount(for: .first)
        
        // then
        XCTAssertEqual(firstWinningCount, 1)
    }
    
    func test_earningsRate_whenBuyFiveLottosAndGetOnceForthWinning_eqaulToOne() throws {
        //given
        let lottos: [Lotto] = [forthWinningNumbers,
                               noneWinningNumbers,
                               noneWinningNumbers,
                               noneWinningNumbers,
                               noneWinningNumbers]
            .map(Lotto.init)
        
        let sut = LottoResult(lottos: lottos,
                              lottoRankChecker: lottoRankChecker)
        
        // when
        let result: Double = sut.earningsRate
        
        // then
        let expectation: Double = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_earningsRate_whenContainsInvalidLotto_addedToBoughtLotto() throws {
        //given
        let invalidLottoNumbers = [46]
        let lottos: [Lotto] = [forthWinningNumbers,
                               invalidLottoNumbers]
            .map(Lotto.init)
        let sut = LottoResult(lottos: lottos,
                              lottoRankChecker: lottoRankChecker)
        // when
        let result: Double = sut.earningsRate
        
        // then
        let buyLottoMoney: Double = Double(lottos.count * Lotto.Constants.price)
        let prizeMoney: Double = Double(LottoRank.forth.prizeMoney)
        let expectation: Double = prizeMoney / buyLottoMoney
        XCTAssertEqual(result, expectation)
    }
}
