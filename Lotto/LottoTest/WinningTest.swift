//
//  WinningStatisticTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/18.
//

import XCTest

class WinningTest: XCTestCase {
    let winningNumber = WinningNumber()

    func test_로또번호_3개일치() {
        winningNumber.register([1,3,5,7,9,11])
        let numbers = [1,2,3,4,5,6]
        let resultWinning = winningNumber.match(numbers)
        let expectedWinning = Winning.fifth
        XCTAssert(resultWinning == expectedWinning, "로또 번호 3개 일치 실패")
    }
    
    func test_로또번호_2등당첨() {
        winningNumber.register([1,3,5,7,9,11])
        winningNumber.register(10)
        let numbers = [1,3,5,7,9,10]
        let resultWinning = winningNumber.match(numbers)
        let expectedWinning = Winning.second
        XCTAssert(resultWinning == expectedWinning, "로또 2등 당첨 실패")
    }

}
