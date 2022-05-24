//
//  LottoTest.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

import XCTest

class LottoTest: XCTestCase {
    private let seller = try? LottoSeller(purchaseAmount: "3000", lottoMaker: LottoSameNumberMaker())
    private lazy var winningLotto = try? WinningLottoMaker(lastWeekWinningNumber: "1, 2, 3, 4, 5, 6", bonusNumber: 7).makeWinningLotto()
    let manualUserLotto: [String] = ["11, 12, 13, 14, 15, 16", "17, 18, 19, 20, 21, 22"]
    private lazy var userLotto = try? seller!.sellLotto(manualNumber: 2,
                                                  manualUserLotto: manualUserLotto)
    private lazy var cetner = LottoCenter(winningLotto: winningLotto!)
    private lazy var user = User(userLotto: userLotto!, center: cetner)
    private lazy var rankReport = RankReport(winning: user.winning())
    
    private let userLottoMockForAllFirst = UserLotto(purchasedLottos: [
        Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)]),
        
        Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)]),
        
        Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)])
    ])
    
    private let userLottoMock = UserLotto(purchasedLottos: [
        Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)]),
        
        Lotto(numbers: [LottoNumber(number: 11), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)]),
        
        Lotto(numbers: [LottoNumber(number: 11), LottoNumber(number: 2),
                        LottoNumber(number: 33), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)])
    ])
    
    private let userLottoMockWithManualLotto = UserLotto(purchasedLottos: [
        Lotto(numbers: [LottoNumber(number: 11), LottoNumber(number: 12),
                        LottoNumber(number: 13), LottoNumber(number: 14),
                        LottoNumber(number: 15), LottoNumber(number: 16)])
    ])
    
    private let userLottoWithBonusNumberMock = UserLotto(purchasedLottos: [
        Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)]),
        
        Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                        LottoNumber(number: 3), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 7)]),
        
        Lotto(numbers: [LottoNumber(number: 11), LottoNumber(number: 2),
                        LottoNumber(number: 33), LottoNumber(number: 4),
                        LottoNumber(number: 5), LottoNumber(number: 6)])
    ])
    
    private let firstLottoMock = Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                                                 LottoNumber(number: 3), LottoNumber(number: 4),
                                                 LottoNumber(number: 5), LottoNumber(number: 6)])
    
    private let secondLottoMock = Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                                                 LottoNumber(number: 3), LottoNumber(number: 4),
                                                 LottoNumber(number: 5), LottoNumber(number: 7)])
    
    private let thirdLottoMock = Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 22),
                                                 LottoNumber(number: 3), LottoNumber(number: 4),
                                                 LottoNumber(number: 5), LottoNumber(number: 6)])
    
    private let fourthLottoMock = Lotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 22),
                                                 LottoNumber(number: 33), LottoNumber(number: 4),
                                                 LottoNumber(number: 5), LottoNumber(number: 6)])
    
    private let winningLottoMock = WinningLotto(numbers: [LottoNumber(number: 1), LottoNumber(number: 2),
                                                          LottoNumber(number: 3), LottoNumber(number: 4),
                                                          LottoNumber(number: 5), LottoNumber(number: 6)], bonusNumber: 7)
    
    private let reportMock = Report(first: 3, second: 0, third: 0, fourth: 0, fifth: 0)
    private let reportMockWithManualLotto = Report(first: 1, second: 0, third: 0, fourth: 0, fifth: 0)
    
    func testPurchasedNumber() {
        let number: Int = (seller?.purchasedNumber())!
        
        XCTAssertEqual(number, 3)
    }
    
    func testSellLottoWithManualLotto() {
        let manualLotto: [String] = ["11, 12, 13, 14, 15, 16"]
        let userLotto = try? seller?.sellLotto(manualNumber: 1,
                                        manualUserLotto: manualLotto)
        print(userLotto)
    }
    
    func testSellLotto() {
        let manualUserLotto: [String] = []
        let userLotto = try? seller?.sellLotto(manualNumber: 0,
                                        manualUserLotto: manualUserLotto)
        
        XCTAssertEqual(userLotto, userLottoMockForAllFirst)
    }
    
    func testWinningLottoMatchCountIs6() {
        let matchCount: Int = (winningLotto?.matchCount(numberToMatch: firstLottoMock))!
        
        XCTAssertEqual(matchCount, 6)
    }
    
    func testWinningLottoMatchCountIs5() {
        let matchCount: Int = (winningLotto?.matchCount(numberToMatch: thirdLottoMock))!
        
        XCTAssertEqual(matchCount, 5)
    }
    
    func testWinningLottoMatchCountIs4() {
        let matchCount: Int = (winningLotto?.matchCount(numberToMatch: fourthLottoMock))!
        
        XCTAssertEqual(matchCount, 4)
    }
    
    func testRankReport() {
        let report: Report = rankReport.report()
        
        XCTAssertEqual(report, reportMockWithManualLotto)
    }
    
    func testRankReportWithManualLotto() {
        let manualUserLotto: [String] = []
        let userLotto = (try? (seller?.sellLotto(manualNumber: 0,
                                                 manualUserLotto: manualUserLotto))!)!
        let cetner = LottoCenter(winningLotto: winningLotto!)
        let user = User(userLotto: userLotto, center: cetner)
        let rankReport = RankReport(winning: user.winning())
        
        XCTAssertEqual(rankReport.report(), reportMock)
    }
    
    func testLottoMatch() {
        let winning: [Rank] = cetner.match(userLotto: userLottoMock)
        
        XCTAssertEqual(winning, [Rank.first, Rank.third, Rank.fourth])
    }
    
    func testLottoMatchWithBonus() {
        let winning: [Rank] = cetner.match(userLotto: userLottoWithBonusNumberMock)

        XCTAssertEqual(winning, [Rank.first, Rank.second, Rank.fourth])
    }
    
    func testReward() {
        let reward: Int = Rank.fifth.reward
        
        XCTAssertEqual(reward, 5000)
    }
    
    func testYield() {
        let yield: Double = UserTotalYield.yield(winning: [Rank.first, Rank.third, Rank.fourth])
        
        XCTAssertEqual(yield.floorTwoDecimalPlaces, 667183.33)
    }
    
    func testConvertStringAmountToInt() {
        let amount: String = "5000"
        let number: Int = StringUtiltity.convertStringAmountToInt(to: amount)
        
        XCTAssertEqual(number, 5)
    }
    
    func testSplitLottoNumbers() {
        let input: String = "1, 2, 3, 4, 5, 6"
        let result: [Int] = try! StringUtiltity.splitLottoNumbers(to: input)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 5, 6])
    }
    
    func testMakeWinningLotto() {
        let basicNumbers: String = "1, 2, 3, 4, 5, 6"
        let bonusNumber: Int = 7
        let winningLottoMaker: WinningLottoMaker = WinningLottoMaker(lastWeekWinningNumber: basicNumbers, bonusNumber: bonusNumber)
        let winningLotto: WinningLotto = try! winningLottoMaker.makeWinningLotto()
        
        XCTAssertEqual(winningLotto, winningLottoMock)
    }
    
    func testMakeLotto() {
        let userLotto: [LottoNumber] = LottoSameNumberMaker().make()
        
        XCTAssertEqual(userLotto, [LottoNumber(number: 1), LottoNumber(number: 2),
                                   LottoNumber(number: 3), LottoNumber(number: 4),
                                   LottoNumber(number: 5), LottoNumber(number: 6)])
    }
    
    func testWinningLottoMatchCountIs5AndBonusNumber() {
        let rank = Rank.from(matchingCount: 5, matchBonus: true)
        
        XCTAssertEqual(rank, Rank.second)
    }

    func testMakeLottoRandomNumber() {
        let lottoMaker = LottoRandomNumberMaker()
        let lotto = lottoMaker.make()
        
        XCTAssertTrue(lotto.count > 0)
    }
}
