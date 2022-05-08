//
//  LottoNumber.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest
@testable import Lotto

class LottoNumberTest: XCTestCase {
    func test_LottoNumber_로또숫자로_0이하의정수가_입력되면_error를_throw한다() {
        // given
        let negativeNumber = -1
        
        // when
        // then
        XCTAssertThrowsError(try LottoNumber(value: -1), "로또 숫자로 0이하의 정수가 입력되면 error를 throw한다") { error in
            XCTAssert(error is LottoNumber.Error)
            XCTAssert(error.localizedDescription == LottoNumber.Error.invalidValue(negativeNumber).localizedDescription)
        }
    }

}
