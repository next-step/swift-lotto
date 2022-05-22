//
//  LottoTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/07.
//

import XCTest
@testable import Lotto

class LottoTest: XCTestCase {
    func test_로또번호_중복아닌6개숫자_생성() {
        let lotto = Lotto()
        let lottoNumbers = Set(lotto.getNumbers())
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
    
    func test_로또번호_수동_입력_생성() {
        let lotto = Lotto(numbers: [1,2,3,4,5,6])
        let expected = [1,2,3,4,5,6]
        XCTAssert(lotto.getNumbers() == expected, "로또 번호가 올바르게 입력되었습니다")
    }
    
}
