//
//  LottoResultTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/07.
//

import XCTest

class LottoResultTests: XCTestCase {
    
    var lottoRankChecker: LottoRankChecker!
    var firstWinningNumbers: [LottoNumber]!
    var secondWinningNumbers: [LottoNumber]!
    var thirdWinningNumbers: [LottoNumber]!
    var forthWinningNumbers: [LottoNumber]!
    var fifthWinningNumbers: [LottoNumber]!
    var noneWinningNumbers: [LottoNumber]!
    
    override func setUpWithError() throws {
        let winningNumber1 = 1
        let winningNumber2 = 2
        let winningNumber3 = 3
        let winningNumber4 = 4
        let winningNumber5 = 5
        let winningNumber6 = 6
        let winningNumbers = try [winningNumber1,
                              winningNumber2,
                              winningNumber3,
                              winningNumber4,
                              winningNumber5,
                              winningNumber6].map(LottoNumber.init)
        let winningLotto = try Lotto(numbers: winningNumbers)
        let bonusNumber = 45
        lottoRankChecker = try LottoRankChecker(winningLotto: winningLotto,
                                                bonusNumber: LottoNumber(value: bonusNumber))
        
        let noneWinningNumber1 = 7
        let noneWinningNumber2 = 8
        let noneWinningNumber3 = 9
        let noneWinningNumber4 = 10
        firstWinningNumbers = try [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               winningNumber4,
                               winningNumber5,
                               winningNumber6].map(LottoNumber.init)
        secondWinningNumbers = try [winningNumber1,
                                winningNumber2,
                                winningNumber3,
                                winningNumber4,
                                winningNumber5,
                                bonusNumber].map(LottoNumber.init)
        thirdWinningNumbers = try [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               winningNumber4,
                               winningNumber5,
                               noneWinningNumber1].map(LottoNumber.init)
        forthWinningNumbers = try [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               winningNumber4,
                               noneWinningNumber1,
                               noneWinningNumber2].map(LottoNumber.init)
        fifthWinningNumbers = try [winningNumber1,
                               winningNumber2,
                               winningNumber3,
                               noneWinningNumber1,
                               noneWinningNumber2,
                               noneWinningNumber3].map(LottoNumber.init)
        noneWinningNumbers = try [winningNumber1,
                              winningNumber2,
                              noneWinningNumber1,
                              noneWinningNumber2,
                              noneWinningNumber3,
                              noneWinningNumber4].map(LottoNumber.init)
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
        let lottos: [Lotto] = try [firstWinningNumbers,
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
        
        let lottos: [Lotto] = try [firstWinningNumbers]
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
    
    func test_earningsRate_whenBuyFiveLottosAndGetOnceFifthWinning_eqaulToOne() throws {
        //given
        let lottos: [Lotto] = try [fifthWinningNumbers,
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
}
