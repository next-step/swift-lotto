//
//  LottoTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest
@testable import Lotto


class AutoLottoTest: XCTestCase {

    func test_init_Lotto를_구성하는_번호개수가_6개가_아니면_nil을_반환한다() {
        // given
        let lottoNumbers = [1, 2, 3, 4, 5, 4]

        // when
        // then
        XCTAssertNil(AutoLotto(numbers: lottoNumbers))
    }
    
    func test_1에서45이내의_숫자만_갖는다_그외의_숫자가_입력되면_nil을_반환한다() {
        // given
        let lottoNumbers = [1, 45, 0, 46, 2, 3]
        
        // when
        // wheng
        XCTAssertNil(AutoLotto(numbers: lottoNumbers))
    }
    
    func test_contains_입력된_숫자를_로또가_가지고_있으면_true를_반환한다() throws {
        // given
        let lotto = AutoLotto(numbers: [1, 2, 3, 4, 5, 6])
        
        // when
        let result = lotto?.contains(number: LottoNumber(6))
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_contains_입력된_숫자를_로또가_가지고_있지않으면_false를_반환한다() throws {
        // given
        let lotto = AutoLotto(numbers: [1, 2, 3, 4, 5, 6])
        
        // when
        let result = lotto?.contains(number: LottoNumber(7))
        
        // then
        XCTAssert(result == false)
    }
}
