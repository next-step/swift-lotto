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
        let lottoNumbers = Set([LottoNumber(1),
                                LottoNumber(2),
                                LottoNumber(3),
                                LottoNumber(4),
                                LottoNumber(5)].compactMap({ $0 }))

        // when
        // then
        XCTAssertThrowsError(try Lotto(numbers: lottoNumbers), "Lotto를 구성하는 번호 개수가 6개가 아니라면 에러를 발생시킨다.") { error in
            XCTAssert(error is Lotto.Error)
            XCTAssert(error.localizedDescription == Lotto.Error.invalidNumberCount(lottoNumbers.count).localizedDescription)
        }
    }

    func test_equalNumberCount_입력받은_Lotto와_일치하는_번호개수를_반환한다() {
            // given
            let lottoNumbers = Set([LottoNumber(2),
                                    LottoNumber(3),
                                    LottoNumber(4),
                                    LottoNumber(5),
                                    LottoNumber(6),
                                    LottoNumber(7)].compactMap({ $0 }))
            let lotto = try! Lotto(numbers: lottoNumbers)

            let winlottoNumbers = Set([LottoNumber(1),
                                       LottoNumber(2),
                                       LottoNumber(3),
                                       LottoNumber(4),
                                       LottoNumber(5),
                                       LottoNumber(6)].compactMap({ $0 }))
            let winLotto = try! Lotto(numbers: winlottoNumbers)

            // when
            let equalNumberCount = lotto.equalNumberCount(with: winLotto)

            // then
            XCTAssertEqual(equalNumberCount, 5)
        }
}
