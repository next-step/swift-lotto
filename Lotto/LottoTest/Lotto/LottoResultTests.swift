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
    var fifthWinningNumbers: [Int]!
    var noneWinningNumbers: [Int]!
    
    override func setUpWithError() throws {
        let winningNumber1 = 1
        let winningNumber2 = 2
        let winningNumber3 = 3
        let winningNumber4 = 4
        let winningNumber5 = 5
        let winningNumber6 = 6
        let winningNumbers = [winningNumber1,
                              winningNumber2,
                              winningNumber3,
                              winningNumber4,
                              winningNumber5,
                              winningNumber6]
        
        let bonusNumber = 45
        lottoRankChecker = try LottoRankChecker(winningNumbers: winningNumbers, bonusNumber: bonusNumber)
        
        let noneWinningNumber1 = 7
        let noneWinningNumber2 = 8
        let noneWinningNumber3 = 9
        let noneWinningNumber4 = 10
        firstWinningNumbers = [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               winningNumber4,
                               winningNumber5,
                               winningNumber6]
        secondWinningNumbers = [winningNumber1,
                                winningNumber2,
                                winningNumber3,
                                winningNumber4,
                                winningNumber5,
                                bonusNumber]
        thirdWinningNumbers = [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               winningNumber4,
                               winningNumber5,
                               noneWinningNumber1]
        forthWinningNumbers = [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               winningNumber4,
                               noneWinningNumber1,
                               noneWinningNumber2]
        fifthWinningNumbers = [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               noneWinningNumber1,
                               noneWinningNumber2,
                               noneWinningNumber3]
        noneWinningNumbers = [winningNumber1,
                              winningNumber2,
                              noneWinningNumber1,
                              noneWinningNumber2,
                              noneWinningNumber3,
                              noneWinningNumber4]
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
                               forthWinningNumbers,
                               fifthWinningNumbers]
            .map(Lotto.init)
        
        let sut = LottoResult(lottos: lottos,
                              lottoRankChecker: lottoRankChecker)
        
        // when
        // then
        XCTAssertEqual(sut.winningCount(for: .first), 1)
        XCTAssertEqual(sut.winningCount(for: .second), 1)
        XCTAssertEqual(sut.winningCount(for: .third), 1)
        XCTAssertEqual(sut.winningCount(for: .forth), 1)
        XCTAssertEqual(sut.winningCount(for: .fifth), 1)
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
        XCTAssertEqual(sut.winningCount(for: .fifth), 0)
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
    
    func test_earningsRate_whenBuyFiveLottosAndGetOnceFifthWinning_eqaulToOne() throws {
        //given
        let lottos: [Lotto] = [fifthWinningNumbers,
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
