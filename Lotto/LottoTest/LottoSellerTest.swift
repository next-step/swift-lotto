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
        let lottoFactory = UserLottoFactory(lottoNumberGenerator: StubLottoNumberGenerator())
        lottoSeller = LottoSeller(lottoFactory: lottoFactory)
    }
    
    override func tearDownWithError() throws {
        lottoSeller = nil
    }
    
    func test_sellLotto_금액을_입력받아서_해당금액으로_구매할수있는_최대수량의_lotto를담은_lottoTicket을_반환한다() {
        // given
        let money = Money(value: 2200)!
        
        let firstLotto = try? UserLotto(numbers: [1, 2, 3, 4, 5, 6])
        let secondLotto = try? UserLotto(numbers: [7, 8, 9, 10, 11, 12])
        
        let expectedLottoTicket = LottoBag(lottoList: [firstLotto, secondLotto]
                                            .compactMap({ $0 }))
        
        // when
        let lottoTicket = try? lottoSeller.sellLotto(for: money)
        
        // then
        XCTAssert(lottoTicket?.totalCount == expectedLottoTicket.totalCount)
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
    
    func test_sellLotto_로또를_넘기면서_호출하면_해당_로또를포함하면서_구매가능한_최대수량의_로또를담은_LottoBag을_반환한다() throws {
        // given
        let money = Money(value: 2000)!
        let customLotto1 = try CustomLotto(numbers: [1, 2, 3, 4, 5, 6])
        let customLotto2 = try CustomLotto(numbers: [1, 2, 3, 4, 6, 7])
        
        // when
        let lottoBag = try lottoSeller.sellLotto(for: money, with: [customLotto1, customLotto2])
        
        // then
        XCTAssertTrue(lottoBag.lottoList.contains { $0.numbers == customLotto1.numbers })
        XCTAssertTrue(lottoBag.lottoList.contains { $0.numbers == customLotto2.numbers })
    }
}
