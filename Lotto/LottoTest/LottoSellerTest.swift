//
//  LottoSellerTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/10.
//

import XCTest
@testable import Lotto

class StubLottoNumberGenerator: LottoNumberGenerator {
    var lottoNumber = 0
    
    func generate() -> LottoNumber {
        lottoNumber += 1
        return try! LottoNumber(value: lottoNumber)
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
        lottoSeller = LottoSeller(lottoTicketMachine: lottoTicketMachine)
    }

    override func tearDownWithError() throws {
        lottoSeller = nil
    }

    func test_sellLotto_금액을_입력받아서_해당금액으로_구매할수있는_최대수량의_lotto를담은_lottoTicket을_반환한다() {
        // given
        let money = Money(value: 2200)!

        let firstLotto = try! Lotto(numbers: [try! LottoNumber(value: 1),
                                         try! LottoNumber(value: 2),
                                         try! LottoNumber(value: 3),
                                         try! LottoNumber(value: 4),
                                         try! LottoNumber(value: 5),
                                         try! LottoNumber(value: 6)])
        let secondLotto = try! Lotto(numbers: [try! LottoNumber(value: 7),
                                         try! LottoNumber(value: 8),
                                         try! LottoNumber(value: 9),
                                         try! LottoNumber(value: 10),
                                         try! LottoNumber(value: 11),
                                         try! LottoNumber(value: 12)])

        let expectedLottoTicket = LottoTicket(lottoList: [firstLotto, secondLotto])

        // when
        let lottoTicket = try! lottoSeller.sellLotto(for: money)

        // then
        XCTAssertEqual(lottoTicket, expectedLottoTicket)
    }
    
    func test_sellLotto_금액이_로또를_사기에_부족한_경우_에러를_던진다() {
        // given
        let money = Money(value: 0)!
        
        // when
        // then
        XCTAssertThrowsError(try lottoSeller.sellLotto(for: money), "금액이 로또를 사기에 부족한 경우 에러를 던진다") { error in
            XCTAssert(error is LottoSeller.Error)
            XCTAssertTrue(error.localizedDescription == LottoSeller.Error.nonEnoughMoney.errorDescription)
        }
    }
}
