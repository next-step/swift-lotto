//
//  LottoTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/07.
//

import XCTest
@testable import Lotto

class LottoTest: XCTestCase {
    let lottoGenerator = LottoGenerator()
    let winningStatistic = WinningStatistic()
    let winningNumber = WinningNumber()
    
    func test_1000원미만_300원_입금시_로또0개_생성() {
        let lottoCount = lottoGenerator.changeMoneyToLottoCount(input: 300)
        let expectedCount = 0
        
        XCTAssert(lottoCount == expectedCount, "로또 1000원 미만 입금시 로또 0개 생성")
    }
    
    func test_로또번호_중복아닌6개숫자_생성() {
        let lotto = Lotto()
        let lottoNumbers = Set(lotto.numbers)
        let expectedCount = 6
        
        XCTAssert(lottoNumbers.count == expectedCount, "로또 번호 6개중 중복 발생")
    }
    
    func test_로또번호_1이상_45이하_숫자만_생성() {
        let lotto = Lotto()
        let expectedValue = true
        var resultValue = false
        if lotto.min() >= 1, lotto.max() <= 45 {
            resultValue = true
        }
            
        XCTAssert(resultValue == expectedValue, "로또 번호 1이상 45 이하 아님")

    }
    
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
