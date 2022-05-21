//
//  LottoRankCheckerTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/06.
//

import XCTest

class LottoRankCheckerTests: XCTestCase {

    var sut: LottoRankChecker!
    
    override func setUpWithError() throws {
        let winningNumbers = try [1,2,3,4,5,6].map(LottoNumber.init)
        let winningLotto = try Lotto(numbers: winningNumbers)
        let bonusNumber = try LottoNumber(value: 45)
        sut = try LottoRankChecker(winningLotto: winningLotto, bonusNumber: bonusNumber)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - init
    
    func test_lottoRankCheckerInit() throws {
        //given
        let winningNumbers = try [1,2,3,4,5,6].map(LottoNumber.init)
        let winningLotto = try Lotto(numbers: winningNumbers)
        let bonusNumber = try LottoNumber(value: 45)
        
        // when
        // then
        XCTAssertNoThrow(try LottoRankChecker(winningLotto: winningLotto, bonusNumber: bonusNumber))
    }
    
    func test_lottoRankCheckerInit_whenbonusNumbersIsDuplicated_throwError() throws {
        //given
        let winningNumbers = try [1,2,3,4,5,6].map(LottoNumber.init)
        let winningLotto = try Lotto(numbers: winningNumbers)
        let bonusNumber = try LottoNumber(value: 1)
        
        // then
        XCTAssertThrowsError(try LottoRankChecker(winningLotto: winningLotto, bonusNumber: bonusNumber))
    }
    
    // MARK: - lottoRank
    
    func test_lottoRank_sixNumberAreEqualToTheWinningNumbers_eqaulToFirst() throws {
        //given
        let candidateNumbers = try [1,2,3,4,5,6].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.first
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_fiveNumberAreEqualToTheWinningNumbersAndMatchBonusNumber_eqaulToSecond() throws {
        //given
        let candidateNumbers = try [1,2,3,4,5,45].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.second
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_fiveNumberAreEqualToTheWinningNumbersAndNoMatchbonusNumber_eqaulToThird() throws {
        //given
        let candidateNumbers = try [1,2,3,4,5,7].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.third
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_fourNumberAreEqualToTheWinningNumbersAndMatchBonusNumber_eqaulToForth() throws {
        //given
        let candidateNumbers = try [1,2,3,4,7,45].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.forth
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_fourNumberAreEqualToTheWinningNumbersAndNoMatchBonusNumber_eqaulToForth() throws {
        //given
        let candidateNumbers = try [1,2,3,4,7,8].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.forth
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_threeNumberAreEqualToTheWinningNumbers_eqaulToFifth() throws {
        //given
        let candidateNumbers = try [1,2,3,7,8,9].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.fifth
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_underThreeNumberAreEqualToTheWinningNumbers_eqaulToNone() throws {
        //given
        let candidateNumbers = try [1,2,7,8,9,10].map(LottoNumber.init)
        let candidateLotto = try Lotto(numbers:candidateNumbers)
        
        // when
        let lottoRank: LottoRank = sut.rank(of: candidateLotto)
        
        // then
        let expectation: LottoRank = LottoRank.none
        XCTAssertEqual(lottoRank, expectation)
    }
}
