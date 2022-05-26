//
//  WinningLottoTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/16.
//

import XCTest

class WinningLottoTest: XCTestCase {
    func test_doesMatchBonusLotto_인자로_주어진_Lotto에_bonus번호와_일치하는_번호가_존재하면_true를_반환한다() throws {
        // given
        let winningLotto = WinningLotto(numbers: [1, 2, 3, 4, 5, 6], bonusNumber: 7)
        let lotto = AutoLotto(numbers: [7, 1, 2, 3, 4, 5])!
        
        // when
        let result = winningLotto?.checkBonusNumber(in: lotto)
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_doesMatchBonusLotto_인자로_주어진_Lotto에_bonus번호와_일치하는_번호가_존재하지_않으면_false를_반환한다() throws {
        // given
        let winningLotto = WinningLotto(numbers: [1, 2, 3, 4, 5, 6], bonusNumber: 7)
        let lotto = AutoLotto(numbers: [1, 2, 3, 4, 5, 6])!
        
        // when
        let result = winningLotto?.checkBonusNumber(in: lotto)
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_equalNumberCount_입력받은_Lotto와_일치하는_번호개수를_반환한다() {
        // given
        let lotto = AutoLotto(numbers: [2, 3, 4, 5, 6, 7])!
        let winLotto = WinningLotto(numbers: [1, 2, 3, 4, 5, 6], bonusNumber: 7)

        // when
        let equalNumberCount = winLotto?.equalNumberCount(with: lotto)

        // then
        XCTAssertEqual(equalNumberCount, 5)
    }
}
