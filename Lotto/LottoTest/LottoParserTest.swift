//
//  LottoParser.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/10.
//

import XCTest
@testable import Lotto

class LottoParserTest: XCTestCase {

    func parse_사용자로부터_받은_로또문자열입력을_Lotto로_파싱하여_반환한다() {
        // given
        let lottoInput = "1, 2, 3, 4, 5, 6"
        
        let expectedLottoNumbers = Set(arrayLiteral: 1, 2, 3, 4, 5, 6)
        
        // when
        let lotto = try! LottoParser.parse(lottoInput)
        
        // then
        XCTAssertEqual(lotto.numbers, expectedLottoNumbers)
    }
}
