//
//  LottoTest.swift
//  LottoTest
//
//  Created by 이우섭 on 2022/05/17.
//

import XCTest

class LottoTest: XCTestCase {
    let sut: Lotto = Lotto(numbers: LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init)))
    
    
    func test_6자리_로또_번호_생성() {
        let expected = 6
        
        XCTAssertEqual(sut.numbers.count, expected)
    }
    
    func test_당첨번호와_숫자_6개가_동일한_로또() {
        let prizeNumbers = LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        let expected = 6
        
        XCTAssertEqual(sut.numbers.match(with: prizeNumbers), expected)
    }

    func test_당첨번호와_숫자_5개가_동일한_로또() {
        let prizeNumbers = LottoNumbers(numbers: [1, 2, 3, 4, 5, 7].compactMap(LottoNumber.init))
        
        let expected = 5
        
        XCTAssertEqual(sut.numbers.match(with: prizeNumbers), expected)
    }
    
    func test_당첨번호와_숫자_6개가_동일하면_1등_당첨금을_받음() {
        let prizeNumbers = LottoNumbers(numbers: [1, 2, 3, 4, 5, 6].compactMap(LottoNumber.init))
        
        let expected = Prize.first.rawValue
        
        let matchNumber = sut.numbers.match(with: prizeNumbers)
        
        XCTAssertEqual(Prize.getPrize(by: matchNumber).rawValue, expected)
    }
    
    func test_당첨번호와_숫자_5개가_동일하고_보너스_숫자가_일치하면_2등_당첨금을_받음() {
        let prizeNumbers = LottoNumbers(numbers: [1, 2, 3, 4, 5, 8].compactMap(LottoNumber.init))
        let bonusNumber = LottoNumber(6)!
        
        let expected = Prize.second.rawValue
        
        let matchNumber = sut.numbers.match(with: prizeNumbers)
        let isBonus = sut.numbers.matchBonus(with: bonusNumber)
        XCTAssertEqual(Prize.getPrize(by: matchNumber, isBonus: isBonus).rawValue, expected)
    }
}
