//
//  LottoTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest

extension Lotto: Equatable {
    static func == (lhs: Lotto, rhs: Lotto) -> Bool {
        return lhs.numbers == rhs.numbers
    }
}

class LottoTest: XCTestCase {

    func test_init_Lotto를_구성하는_번호개수가_6개가_아니면_에러를_발생시킨다() {
        // given
        let lottoNumbers = [try! LottoNumber(value: 1),
                            try! LottoNumber(value: 2),
                            try! LottoNumber(value: 3),
                            try! LottoNumber(value: 4),
                            try! LottoNumber(value: 5),
                            try! LottoNumber(value: 6),
                            try! LottoNumber(value: 7)]
        
        // when
        // then
        XCTAssertThrowsError(try Lotto(numbers: lottoNumbers), "Lotto를 구성하는 번호 개수가 6개가 아니라면 에러를 발생시킨다.") { error in
            XCTAssert(error is Lotto.Error)
            XCTAssert(error.localizedDescription == Lotto.Error.invalidNumberCount(lottoNumbers.count).localizedDescription)
        }
    }
    
    func test_equalNumberCount_입력받은_Lotto와_일치하는_번호개수를_반환한다() {
            // given
            let lottoNumbers = [try! LottoNumber(value: 2),
                                try! LottoNumber(value: 3),
                                try! LottoNumber(value: 4),
                                try! LottoNumber(value: 5),
                                try! LottoNumber(value: 6),
                                try! LottoNumber(value: 7)]
            let lotto = try! Lotto(numbers: lottoNumbers)
            
            let winlottoNumbers = [try! LottoNumber(value: 1),
                                   try! LottoNumber(value: 2),
                                   try! LottoNumber(value: 3),
                                   try! LottoNumber(value: 4),
                                   try! LottoNumber(value: 5),
                                   try! LottoNumber(value: 6)]
            let winLotto = try! Lotto(numbers: winlottoNumbers)
            
            // when
            let equalNumberCount = lotto.equalNumberCount(with: winLotto)
            
            // then
            XCTAssertEqual(equalNumberCount, 5)
        }
}
