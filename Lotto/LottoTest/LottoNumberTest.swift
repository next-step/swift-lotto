//
//  LottoNumber.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/08.
//

import XCTest
@testable import Lotto

class LottoNumberTest: XCTestCase {
    func test_LottoNumber_로또숫자로_0이하의정수가_입력되면_nil이_반환된다() {
        XCTAssertNil(LottoNumber(-1))
    }
    
    func test_LottoNumber_로또숫자로_45가초과되는_정수가_입력되면_nil이반환된다() {
        XCTAssertNil(LottoNumber(46))
    }

}
