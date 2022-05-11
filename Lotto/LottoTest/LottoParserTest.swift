//
//  LottoParser.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/10.
//

import XCTest
@testable import Lotto

class LottoParserTest: XCTestCase {

    func test_parse_사용자로부터_받은_로또문자열입력을_Lotto로_파싱하여_반환한다() {
        // given
        let lottoInput = "1, 2, 3, 4, 5, 6"
        
        let expectedLotto = try! Lotto(numbers: [LottoNumber(1),
                                                 LottoNumber(2),
                                                 LottoNumber(3),
                                                 LottoNumber(4),
                                                 LottoNumber(5),
                                                 LottoNumber(6)].compactMap({ $0 }))
        
      
        // when
        let lotto = try! LottoParser.parse(lottoInput)
        
        // then
        XCTAssert(lotto == expectedLotto)
    }
}
