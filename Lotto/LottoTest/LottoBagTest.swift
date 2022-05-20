//
//  LottoBagTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/15.
//

import XCTest

class LottoBagTest: XCTestCase {

    func test_winngRecord_당첨번호를_담은_lotto를_받아서_현재LottoBag의_당첨통계정보를담는_WinningRecord를_반환한다() {
        // given
        let firstLotto = try? UserLotto(numbers: [1, 2, 3, 4, 5, 6])
        let secondLotto = try? UserLotto(numbers: [2, 3, 4, 5, 6, 7])
        
        let lottoTicket = LottoBag(lottoList: [firstLotto, secondLotto]
                                    .compactMap({ $0 }))
        
        guard let winningLotto = try? WinningLotto(numbers: [3, 4, 5, 6, 7, 8], bonusNumber: 9) else {
            XCTFail("winningLotto가 nil입니다.")
            return
        }
        
        let expectedRecord = WinningRecord(recordUnits: [(4, false), (5, false)])
        
        
        // when
        let winningRecord = lottoTicket.winningRecord(with: winningLotto)

        // then
        XCTAssertEqual(winningRecord, expectedRecord)
    }
    
    func test_lottoCount_lottBag이_갖는_로또의개수를_반환한다() {
        // given
        let firstLotto = try? UserLotto(numbers: [1, 2, 3, 4, 5, 6])

        let secondLotto = try? UserLotto(numbers: [2, 3, 4, 5, 6, 7])

        let lottoTicket = LottoBag(lottoList: [firstLotto, secondLotto]
                                    .compactMap({ $0 }))

        // when
        // then
        XCTAssertEqual(2, lottoTicket.lottoCount)
    }
    
    func test_lottoCount_주어진_타입의_로또_개수를_반환한다() throws {
        // given
        let userLottos = [try UserLotto(numbers: [1, 2, 3, 4, 5, 6]),
                          try UserLotto(numbers: [1, 2, 3, 4, 5, 6])]
        let customLottos = [try CustomLotto(numbers: [1, 2, 3, 4, 5, 6]),
                            try CustomLotto(numbers: [1, 2, 3, 4, 5, 6]),
                            try CustomLotto(numbers: [2, 3, 4, 5, 6, 7])]
        
        let lottoBag = LottoBag(lottoList: userLottos + customLottos)
        
        // when
        let userLottoCount = lottoBag.lottoCount(UserLotto.self)
        let customLottoCount = lottoBag.lottoCount(CustomLotto.self)
        
        // then
        XCTAssertEqual(userLottos.count, userLottoCount.value)
        XCTAssertEqual(customLottos.count, customLottoCount.value)
    }
}
