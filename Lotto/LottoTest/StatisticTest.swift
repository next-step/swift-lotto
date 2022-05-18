//
//  StatisticTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/18.
//

import XCTest

class StatisticTest: XCTestCase {
    var winningStatistic: WinningStatistic = WinningStatistic()
    
    override func setUp() {
        super.setUp()
        winningStatistic = WinningStatistic()
    }

    func test_모든승리케이스_초기화했는지_확인() {
        var count = 0
        let expectedCount = Winning.allCases.count
        for winning in Winning.allCases {
            let value = winningStatistic.get()[winning]
            count += value == nil ? 0 : 1
        }
        XCTAssert(count == expectedCount, "모든 케이스가 초기화 되지 못했습니다")
    }
    
    func test_3등_추가되면_갯수1개_성공() {
        let thirdWinningType = Winning.third
        winningStatistic.insert(thirdWinningType)
        let count = winningStatistic.get()[thirdWinningType] ?? 0
        let expectedCount = 1
        XCTAssert(count == expectedCount, "승리타입이 추가되지 않았습니다")
    }
    
    func test_5등_2개_당첨금은_10000원() {
        let fifthWinningType = Winning.fifth
        winningStatistic.insert(fifthWinningType)
        winningStatistic.insert(fifthWinningType)
        let price = winningStatistic.appearWinningTotalPrice()
        let expectedPrice = 10000
        XCTAssert(price == expectedPrice, "예상된 상금이 아닙니다.")

    }
}
