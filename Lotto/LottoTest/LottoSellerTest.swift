//
//  LottoSellerTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/10.
//

import XCTest

struct StubLottoNumberGenerator: LottoNumberGenerator {
    func generate() -> LottoNumber {
        return try! LottoNumber(value: 1)
    }
}

extension LottoTicket: Equatable {
    static func == (lhs: LottoTicket, rhs: LottoTicket) -> Bool {
        return lhs.lottoList == rhs.lottoList
    }
}

class LottoSellerTest: XCTestCase {
    var lottoSeller: LottoSeller!
    
    override func setUpWithError() throws {
        let lottoNumberGenerator = StubLottoNumberGenerator()
        let lottoFactory = LottoFactory(lottoNumberGenerator: lottoNumberGenerator)
        let lottoTicketMachine = LottoTicketMachine(lottoFactory: lottoFactory)
        lottoSeller = LottoSeller(lottoMachine: lottoTicketMachine)
    }

    func test_sellLotto_금액을_입력받아서_해당금액으로_구매할수있는_최대수량의_lotto를담은_lottoTicket을_반환한다() {
        // given
        let money = Money(value: 3200)!
    
        let lotto = try! Lotto(numbers: [try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1),
                                    try! LottoNumber(value: 1)])
        
        let expectedLottoTicket = LottoTicket(lottoList: [lotto, lotto, lotto])
        
        // when
        let lottoTicket = try! LottoSeller.sellLotto(for: money)
        
        // then
        XCTAssertEqual(lottoTicket, expectedLottoTicket)
    }
}
