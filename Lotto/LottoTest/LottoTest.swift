//
//  LottoTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest
@testable import Lotto

extension Lotto: Equatable {
    static func == (lhs: Lotto, rhs: Lotto) -> Bool {
        return lhs.numbers == rhs.numbers
    }
}

class LottoTest: XCTestCase {

    func test_init_Lotto를_구성하는_번호개수가_6개가_아니면_에러를_발생시킨다() {
        // given
        let lottoNumbers = [1, 2, 3, 4, 5, 4]

        // when
        // then
        XCTAssertThrowsError(try Lotto(numbers: lottoNumbers), "Lotto를 구성하는 번호 개수가 6개가 아니라면 에러를 발생시킨다.") { error in
            XCTAssert(error is Lotto.Error)
            XCTAssert(error.localizedDescription == Lotto.Error.invalidNumberCount(lottoNumbers.count).localizedDescription)
        }
    }

    func test_equalNumberCount_입력받은_Lotto와_일치하는_번호개수를_반환한다() {
            // given
            let lotto = try! Lotto(numbers: [2, 3, 4, 5, 6, 7])
            let winLotto = try! Lotto(numbers: [1, 2, 3, 4, 5, 6])

            // when
            let equalNumberCount = lotto.equalNumberCount(with: winLotto)

            // then
            XCTAssertEqual(equalNumberCount, 5)
        }
    
    func test_1에서45이내의_숫자만_갖는다_그외의_숫자가_입력되면_error를_던진다() {
        // given
        let lottoNumbers = [1, 45, 0, 46, 2, 3]
        
        // when
        // when
        XCTAssertThrowsError(try Lotto(numbers: lottoNumbers), "Lotto는 1에서45이내의_숫자만_갖는다_그외의_숫자가_입력되면_error를_던진다") { error in
            XCTAssert(error is Lotto.Error)
            XCTAssert(error.localizedDescription == Lotto.Error.invalidLottoNumber.localizedDescription)
        }
    }
}
