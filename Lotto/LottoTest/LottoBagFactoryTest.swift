//
//  LottoBagFactoryTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/15.
//

import XCTest
@testable import Lotto

class LottoBagFactoryTest: XCTestCase {
    var lottoBagFactory: LottoBagFactory!

    override func setUpWithError() throws {
        let lottoFactory = UserLottoFactory(lottoNumberGenerator: StubLottoNumberGenerator())
        lottoBagFactory = LottoBagFactory(lottoFactory: lottoFactory)
    }

    override func tearDownWithError() throws {
        lottoBagFactory = nil
    }

    func test_make_입력된_개수만큼의_Lotto를_담는_LottoBag인스턴스를_생성한다() {
        // given
        let lottoCount = 3

        // when
        let lottoBag = try? lottoBagFactory.make(havingLottoCount: 3)

        // then
        XCTAssert(lottoBag?.totalCount == lottoCount)
    }
}
