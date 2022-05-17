//
//  LottoTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest
@testable import Lotto


class UserLottoTest: XCTestCase {

    func test_init_Lotto를_구성하는_번호개수가_6개가_아니면_에러를_발생시킨다() {
        // given
        let lottoNumbers = [1, 2, 3, 4, 5, 4]

        // when
        // then
        XCTAssertThrowsError(try UserLotto(numbers: lottoNumbers), "Lotto를 구성하는 번호 개수가 6개가 아니라면 에러를 발생시킨다.") { error in
            XCTAssert(error is LottoError)
            XCTAssert(error.localizedDescription == LottoError.invalidNumberCount(lottoNumbers.count).localizedDescription)
        }
    }
    
    func test_1에서45이내의_숫자만_갖는다_그외의_숫자가_입력되면_error를_던진다() {
        // given
        let lottoNumbers = [1, 45, 0, 46, 2, 3]
        
        // when
        // wheng
        XCTAssertThrowsError(try UserLotto(numbers: lottoNumbers), "Lotto는 1에서45이내의_숫자만_갖는다_그외의_숫자가_입력되면_error를_던진다") { error in
            XCTAssert(error is LottoError)
            XCTAssert(error.localizedDescription == LottoError.invalidLottoNumber.localizedDescription)
        }
    }
    
    func test_contains_입력된_숫자를_로또가_가지고_있으면_true를_반환한다() throws {
        // given
        let lotto = try UserLotto(numbers: [1, 2, 3, 4, 5, 6])
        
        // when
        let result = lotto.contains(number: 6)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_contains_입력된_숫자를_로또가_가지고_있지않으면_false를_반환한다() throws {
        // given
        let lotto = try UserLotto(numbers: [1, 2, 3, 4, 5, 6])
        
        // when
        let result = lotto.contains(number: 7)
        
        // then
        XCTAssertFalse(result)
    }
}
