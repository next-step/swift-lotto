//
//  LottoTicketTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest
@testable import Lotto

class LottoTicketTest: XCTestCase {

    func test_winngRecord_당첨번호를_담은_lotto를_받아서_현재LottoTicket의_당첨통계정보를담는_WinningRecord를_반환한다() {
        // given
        let firstLotto = try! Lotto(numbers: [LottoNumber(1),
                                              LottoNumber(2),
                                              LottoNumber(3),
                                              LottoNumber(4),
                                              LottoNumber(5),
                                              LottoNumber(6)].compactMap({ $0 }))
        
        let secondLotto = try! Lotto(numbers: [LottoNumber(2),
                                               LottoNumber(3),
                                               LottoNumber(4),
                                               LottoNumber(5),
                                               LottoNumber(6),
                                               LottoNumber(7)].compactMap({ $0 }))
        
        let lottoTicket = LottoTicket(lottoList: [firstLotto, secondLotto])
        
        let winningLotto = try! Lotto(numbers: [LottoNumber(3),
                                                LottoNumber(4),
                                                LottoNumber(5),
                                                LottoNumber(6),
                                                LottoNumber(7),
                                                LottoNumber(8)].compactMap({ $0 }))
        

        let expectedRecord = WinningRecord(equalNumberCounts:
        [4, 5])

        // when
        let winningRecord = lottoTicket.winningRecord(with: winningLotto)
        
        // then
        XCTAssertEqual(winningRecord, expectedRecord)
    }
    
    func test_lottoCount_lottTicket이_갖는_로또의개수를_반환한다() {
        // given
        let firstLotto = try! Lotto(numbers: [LottoNumber(1),
                                              LottoNumber(2),
                                              LottoNumber(3),
                                              LottoNumber(4),
                                              LottoNumber(5),
                                              LottoNumber(6)].compactMap({ $0 }))
        
        let secondLotto = try! Lotto(numbers: [LottoNumber(2),
                                               LottoNumber(3),
                                               LottoNumber(4),
                                               LottoNumber(5),
                                               LottoNumber(6),
                                               LottoNumber(7)].compactMap({ $0 }))
        
        let lottoTicket = LottoTicket(lottoList: [firstLotto, secondLotto])
        
        // when
        // then
        XCTAssertEqual(2, lottoTicket.lottoCount)
    }
}
