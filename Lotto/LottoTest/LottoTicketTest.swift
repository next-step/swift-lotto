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
        let firstLotto = try! Lotto(numbers: [try! LottoNumber(value: 1),
                                              try! LottoNumber(value: 2),
                                              try! LottoNumber(value: 3),
                                              try! LottoNumber(value: 4),
                                              try! LottoNumber(value: 5),
                                              try! LottoNumber(value: 6)])
        
        let secondLotto = try! Lotto(numbers: [try! LottoNumber(value: 2),
                                               try! LottoNumber(value: 3),
                                               try! LottoNumber(value: 4),
                                               try! LottoNumber(value: 5),
                                               try! LottoNumber(value: 6),
                                               try! LottoNumber(value: 7)])
        
        let lottoTicket = LottoTicket(lottoList: [firstLotto, secondLotto])
        
        let winningLotto = try! Lotto(numbers: [try! LottoNumber(value: 3),
                                                try! LottoNumber(value: 4),
                                                try! LottoNumber(value: 5),
                                                try! LottoNumber(value: 6),
                                                try! LottoNumber(value: 7),
                                                try! LottoNumber(value: 8)])
        

        let expectedStatistics = WinningStatistics(equalNumberCounts:
        [4, 5])

        // when
        let winningRecord = lottoTicket.winningStatistics(with: winningLotto)
        
        // then
        XCTAssertEqual(winningRecord, expectedStatistics)
    }
    
    func test_lottoCount_lottTicket이_갖는_로또의개수를_반환한다() {
        // given
        let firstLotto = try! Lotto(numbers: [try! LottoNumber(value: 1),
                                              try! LottoNumber(value: 2),
                                              try! LottoNumber(value: 3),
                                              try! LottoNumber(value: 4),
                                              try! LottoNumber(value: 5),
                                              try! LottoNumber(value: 6)])
        
        let secondLotto = try! Lotto(numbers: [try! LottoNumber(value: 2),
                                               try! LottoNumber(value: 3),
                                               try! LottoNumber(value: 4),
                                               try! LottoNumber(value: 5),
                                               try! LottoNumber(value: 6),
                                               try! LottoNumber(value: 7)])
        
        let lottoTicket = LottoTicket(lottoList: [firstLotto, secondLotto])
        
        // when
        let lottoCount = lottoTicket.lottoCount()
        
        // then
        XCTAssertEqual(2, lottoCount)
    }
}
