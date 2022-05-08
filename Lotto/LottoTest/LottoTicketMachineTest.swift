//
//  LottoTicketMachineTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest

class FakeLottoNumberGenerator: LottoNumberGenerator {
    var count = 1
    
    func generate() -> LottoNumber {
        let lottoNumber = try! LottoNumber(value: count)
        count += 1
        return lottoNumber
    }
}

class LottoTicketMachineTest: XCTestCase {
    func test_printTicket_주어진_개수만큼의_로또를_갖는_로또티켓을_출력한다() {
        // given
        let lottoFactory = LottoFactory(lottoNumberGenerator: FakeLottoNumberGenerator())
        let lottoTicketMachine = LottoTicketMachine(lottoFactory: lottoFactory)
        
        let lottoCount = 7
        
        // when
        let lottoTicket = lottoTicketMachine.printTicket(count: lottoCount)
        
        // then
        XCTAssertEqual(lottoCount, lottoTicket.lottoList.count)
    }
}
