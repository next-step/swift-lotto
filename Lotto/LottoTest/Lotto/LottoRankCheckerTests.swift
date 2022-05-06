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
        let winningNumbers = [1,2,3,4,5,6]
        sut = try LottoRankChecker(winningNumbers: winningNumbers)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - init
    
    func test_lottoRankCheckerInit_whenWinningNumbersCountIsUnderSix_throwError() {
        //given
        let winningNumbers = [1,2,3,4,5]
        
        // when
        // then
        XCTAssertThrowsError(try LottoRankChecker(winningNumbers: winningNumbers))
    }
    
    func test_lottoRankCheckerInit_whenWinningNumbersCountIsOverSix_throwError() {
        //given
        let winningNumbers = [1,2,3,4,5,6,7]
        
        // when
        // then
        XCTAssertThrowsError(try LottoRankChecker(winningNumbers: winningNumbers))
    }
    
    func test_lottoRankCheckerInit_whenWinningNumbersContainOverRanged_throwError() throws {
        //given
        let winningNumbers = [1,2,3,4,5,46]
        
        // when
        // then
        XCTAssertThrowsError(try LottoRankChecker(winningNumbers: winningNumbers))
    }
    
    func test_lottoRankCheckerInit_whenWinningNumbersContainUnderRanged_throwError() throws {
        //given
        let winningNumbers = [0,1,2,3,4,5]
        
        // when
        // then
        XCTAssertThrowsError(try LottoRankChecker(winningNumbers: winningNumbers))
    }
    
    func test_lottoRankCheckerInit_whenWinningNumbersAreDuplicated_throwError() throws {
        //given
        let winningNumbers = [1,2,3,4,5,5]
        
        // then
        XCTAssertThrowsError(try LottoRankChecker(winningNumbers: winningNumbers))
    }
    
    // MARK: - lottoRank
    
    func test_lottoRank_sixNumberAreEqualToTheWinningNumbers_eqaulToFirst() throws {
        //given
        
        let candidateNumbers = [1,2,3,4,5,6]
        
        // when
        let lottoRank: LottoRank = try sut.rank(of: candidateNumbers)
        
        // then
        let expectation: LottoRank = LottoRank.first
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_fiveNumberAreEqualToTheWinningNumbers_eqaulToSecond() throws {
        //given
        let candidateNumbers = [1,2,3,4,5,7]
        
        // when
        let lottoRank: LottoRank = try sut.rank(of: candidateNumbers)
        
        // then
        let expectation: LottoRank = LottoRank.second
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_fourNumberAreEqualToTheWinningNumbers_eqaulToThird() throws {
        //given
        let candidateNumbers = [1,2,3,4,7,8]
        
        // when
        let lottoRank: LottoRank = try sut.rank(of: candidateNumbers)
        
        // then
        let expectation: LottoRank = LottoRank.third
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_threeNumberAreEqualToTheWinningNumbers_eqaulToForth() throws {
        //given
        let candidateNumbers = [1,2,3,7,8,9]
        
        // when
        let lottoRank: LottoRank = try sut.rank(of: candidateNumbers)
        
        // then
        let expectation: LottoRank = LottoRank.forth
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_underThreeNumberAreEqualToTheWinningNumbers_eqaulToNone() throws {
        //given
        let candidateNumbers = [1,2,7,8,9,10]
        
        // when
        let lottoRank: LottoRank = try sut.rank(of: candidateNumbers)
        
        // then
        let expectation: LottoRank = LottoRank.none
        XCTAssertEqual(lottoRank, expectation)
    }
    
    func test_lottoRank_whenNumbersContainOverRanged_throwError() throws {
        //given
        let candidateNumbers = [1,2,3,4,5,46]
        
        // when
        // then
        XCTAssertThrowsError(try sut.rank(of: candidateNumbers))
    }
    
    func test_lottoRank_whenNumbersContainUnderRanged_throwError() throws {
        //given
        let candidateNumbers = [0,1,2,3,4,5]
        
        // when
        // then
        XCTAssertThrowsError(try sut.rank(of: candidateNumbers))
    }
    
    func test_lottoRank_whenNumbersCountIsUnderSix_throwError() throws {
        //given
        let candidateNumbers = [1,2,3,4,5]
        
        // when
        // then
        XCTAssertThrowsError(try sut.rank(of: candidateNumbers))
    }
    
    func test_lottoRank_whenNumbersCountIsOverSix_throwError() throws {
        //given
        let candidateNumbers = [1,2,3,4,5,6,7]
        
        // when
        // then
        XCTAssertThrowsError(try sut.rank(of: candidateNumbers))
    }
    
    func test_lottoRank_whenNumbersAreDuplicated_throwError() throws {
        //given
        let candidateNumbers = [1,2,3,4,5,5]
        
        // then
        XCTAssertThrowsError(try sut.rank(of: candidateNumbers))
    }
}
