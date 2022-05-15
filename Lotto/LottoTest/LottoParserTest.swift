//
//  LottoParserTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/15.
//

import XCTest

class LottoParserTest: XCTestCase {
    func test_parse_사용자로부터_받은_로또문자열입력을_Lotto로_파싱하여_반환한다() {
        // given
        let lottoInput = "1, 2, 3, 4, 5, 6"
        
        let expectedLotto = try? Lotto(numbers: [1, 2, 3, 4, 5, 6])
        
        // when
        guard let lotto = try? LottoParser.parse(lottoInput) else {
            XCTFail("LottoParser.parse throw Error")
            exit(0)
        }
        
        // then
        XCTAssert(lotto == expectedLotto)
    }
}
