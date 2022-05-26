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
    
    func test_make_with파라미터로_주어진_로또들을_포함하는_LottoBag인스턴스가_생성된다() throws {
        // given
        let givenLottos = [CustomLotto(numbers: [7, 8, 9, 10, 11, 12]),
                           CustomLotto(numbers: [1, 2, 3, 7, 8, 9]),
                           CustomLotto(numbers: [13, 14, 15, 4, 5, 6])].compactMap { $0 }
                
        
        // when
        let lottoBag = try lottoBagFactory.make(havingLottoCount: 5, with: givenLottos)
        
        // then
        XCTAssertTrue(lottoBag.lottoList.contains { $0.numbers  == givenLottos[0].numbers})
        XCTAssertTrue(lottoBag.lottoList.contains { $0.numbers == givenLottos[1].numbers})
        XCTAssertTrue(lottoBag.lottoList.contains { $0.numbers == givenLottos[2].numbers})
    }
}
