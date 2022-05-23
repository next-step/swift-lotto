//
//  LottoTest.swift
//  LottoTest
//
//  Created by 이우섭 on 2022/05/17.
//

import XCTest

class LottoTest: XCTestCase {
    
    func test_10000원을_주면_로또_10장을_반환() {
        let sut = LottoCustomer()
        sut.buyLotto(for: 10000)
        XCTAssertEqual(sut.lottos.count, 10)
    }
    
    func test_6자리_로또_번호_생성() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        XCTAssertEqual(sut.numbers.count, 6)
    }
    
    func test_당첨번호와_숫자_6개가_동일한_로또() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        XCTAssertEqual(sut.match(with: prizeNumbers), 6)
    }

    func test_당첨번호와_숫자_5개가_동일한_로또() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init))
        
        XCTAssertEqual(sut.match(with: prizeNumbers), 5)
    }
    
    func test_당첨번호와_숫자_6개가_동일하면_1등_당첨금을_받음() {
        let sut = Lotto(numbers: LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
        let prizeNumbers = LottoNumbers([1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        let matchNumber = sut.match(with: prizeNumbers)
        
        XCTAssertEqual(sut.getPrize(by: matchNumber), Lotto.Prize.first.rawValue)
    }
}
