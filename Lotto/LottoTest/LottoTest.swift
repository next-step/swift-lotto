//
//  LottoTest.swift
//  LottoTest
//
//  Created by 이우섭 on 2022/05/17.
//

import XCTest

class LottoTest: XCTestCase {
    
    func test_10000원을_주면_로또_10장을_반환() {
        let sut = LottoConsumer()
        let expected = 10
        
        try? sut.buyLotto(for: 10000)
        
        XCTAssertEqual(sut.lottos.count, expected)
    }
    
    func test_6자리_로또_번호_생성() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let expected = 6
        
        XCTAssertEqual(sut.numbers.count, expected)
    }
    
    func test_당첨번호와_숫자_6개가_동일한_로또() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        let expected = 6
        
        XCTAssertEqual(sut.numbers.match(with: prizeNumbers), expected)
    }

    func test_당첨번호와_숫자_5개가_동일한_로또() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init))
        
        let expected = 5
        
        XCTAssertEqual(sut.numbers.match(with: prizeNumbers), expected)
    }
    
    func test_당첨번호와_숫자_6개가_동일하면_1등_당첨금을_받음() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        let expected = Prize.first.rawValue
        
        let matchNumber = sut.numbers.match(with: prizeNumbers)
        
        XCTAssertEqual(Prize.getPrize(by: matchNumber).rawValue, expected)
    }
    
    func test_당첨번호와_숫자_5개가_동일하고_보너스_숫자가_일치하면_2등_당첨금을_받음() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        let bonusNumber = LottoNumber(7)!
        
        let expected = Prize.second.rawValue
        
        let matchNumber = sut.numbers.match(with: prizeNumbers)
        let isBonus = sut.numbers.matchBonus(with: bonusNumber)
        XCTAssertEqual(Prize.getPrize(by: matchNumber, isBonus: true), expected)
    }
    
    func test_10000원어치_로또를_구매후_5000원만큼_당첨되었을때_수익률() {
        let sut = LottoConsumer()
        let expected = 0.5
        try? sut.buyLotto(for: 10000)
        
        XCTAssertEqual(sut.getRatio(of: 5000), expected)
    }
    
    func test_돈이_1000원보다_적으면_insufficientMoney_오류반환() {
        let sut = LottoConsumer()
        let money = 999
        XCTAssertThrowsError(try sut.buyLotto(for: money))
    }
    
    func test_가지고_있는_로또의_당첨여부_확인() {
        let sut = LottoConsumer()
        sut.lottos = [
            Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))),
            Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init)))
        ]
        
        let prizeNumbers: LottoNumbers = LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        let expected: [Prize] = [.first, .second]
        
        XCTAssertEqual(sut.checkLottoPrizes(with: prizeNumbers), expected)
    }
}
