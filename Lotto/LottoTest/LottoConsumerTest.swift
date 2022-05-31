//
//  LottoConsumerTest.swift
//  LottoTest
//
//  Created by 이우섭 on 2022/05/29.
//

import XCTest

class LottoConsumerTest: XCTestCase {
    var sut: LottoConsumer = LottoConsumer()
    
    override func setUpWithError() throws {
        self.sut = LottoConsumer()
    }
    
    func test_10000원을_주면_로또_10장을_반환() {
        let expected = 10
        
        try? sut.buyLotto(for: 10000)
        
        XCTAssertEqual(sut.lottos.count, expected)
    }
    
    func test_주어진_금액보다_수동_로또를_더_많이_구매하면_오류반환() {
        let manualLottos: [Lotto] = [
            Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))),
            Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init))),
        ]
        
        XCTAssertThrowsError(try sut.buyLotto(for: 1000, manualLottos: manualLottos))
    }
    
    func test_수동로또와_자동로또의_갯수를_반환() {
        let manualLottos: [Lotto] = [
            Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))),
            Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init))),
        ]
        
        try? sut.buyLotto(for: 5000, manualLottos: manualLottos)
        
        let manualExpected: Int = 2
        let autoExpected: Int = 3
        
        XCTAssertEqual(sut.manualConut, manualExpected)
        XCTAssertEqual(sut.autoCount, autoExpected)
    }
    
    func test_10000원어치_로또를_구매후_5000원만큼_당첨되었을때_수익률() {
        let expected = 0.5
        try? sut.buyLotto(for: 10000)
        
        XCTAssertEqual(sut.getRatio(of: 5000), expected)
    }
    
    func test_돈이_1000원보다_적으면_insufficientMoney_오류반환() {
        let money = 999
        XCTAssertThrowsError(try sut.buyLotto(for: money))
    }
    
    func test_가지고_있는_로또의_당첨여부_확인() {
        sut.lottos = [
            Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))),
            Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init)))
        ]
        
        let prizeNumbers: LottoNumbers = LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        let bonusNumber: LottoNumber = LottoNumber(8)!
        
        let expected: [Prize] = [.first, .third]
        
        XCTAssertEqual(sut.checkLottoPrizes(with: prizeNumbers, bonusNumber: bonusNumber), expected)
    }
}
