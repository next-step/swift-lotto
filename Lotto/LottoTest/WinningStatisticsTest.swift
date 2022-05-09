//
//  WinningRecordTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest

class WinningStatisticsTest: XCTestCase {
    func test_calculateTheProfitRate_로또구매가격을_입력받아서_수익률을_계산한다(){
        // given
        let winningRecord = WinningStatistics(threeMatchingCount: 1, fourMatchingCount: 0, fiveMatchingCount: 0, sixMatchingCount: 0)
        let expectedProfitRate = Double(5000) / Double(14000) * 100
        let inputMoney = Money(value: 14000)!
        
        // when
        let profitRate = winningRecord.calculateTheProfitRate(inputMoney: inputMoney)
        
        // then
        XCTAssertEqual(profitRate, expectedProfitRate)
    }
}
