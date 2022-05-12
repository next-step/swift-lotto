//
//  LottoTicketMachineTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest

class LottoTicketMachineTest: XCTestCase {
    func test_printTicket_주어진_개수만큼의_로또를_갖는_로또티켓을_출력한다() {
        // given
        let lottoFactory = LottoFactory(lottoNumberGenerator: StubLottoNumberGenerator())
        let lottoTicketMachine = LottoTicketMachine(lottoFactory: lottoFactory)
        
        let lottoCount = 7
        
        // when
        let lottoTicket = try? lottoTicketMachine.printTicket(havingLottoCount: lottoCount)
        
        // then
        XCTAssert(lottoCount == lottoTicket?.lottoList.count)
    }
}
