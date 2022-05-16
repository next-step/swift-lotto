//
//  LottoSellerTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/15.
//

import XCTest

class LottoSellerTest: XCTestCase {
    var lottoSeller: LottoSeller!
    
    override func setUpWithError() throws {
        let lottoFactory = LottoFactory(lottoNumberGenerator: StubLottoNumberGenerator())
        lottoSeller = LottoSeller(lottoFactory: lottoFactory)
    }
    
    override func tearDownWithError() throws {
        lottoSeller = nil
    }
    
    func test_sellLotto_금액을_입력받아서_해당금액으로_구매할수있는_최대수량의_lotto를담은_lottoTicket을_반환한다() {
        // given
        let money = Money(value: 2200)!
        
        let firstLotto = try? DefaultLotto(numbers: [1, 2, 3, 4, 5, 6])
        let secondLotto = try? DefaultLotto(numbers: [7, 8, 9, 10, 11, 12])
        
        let expectedLottoTicket = LottoBag(lottoList: [firstLotto, secondLotto]
                                            .compactMap({ $0 }))
        
        // when
        let lottoTicket = try? lottoSeller.sellLotto(for: money)
        
        // then
        XCTAssert(lottoTicket?.lottoCount == expectedLottoTicket.lottoCount)
    }
    
    func test_sellLotto_금액이_로또를_사기에_부족한_경우_에러를_던진다() {
        // given
        let money = Money(value: 0)!
        
        // when
        // then
        XCTAssertThrowsError(try lottoSeller.sellLotto(for: money), "금액이 로또를 사기에 부족한 경우 에러를 던진다") { error in
            XCTAssert(error is LottoSeller.Error)
            XCTAssertTrue(error.localizedDescription == LottoSeller.Error.notEnoughMoney.errorDescription)
        }
    }
}
