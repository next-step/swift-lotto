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
    
    func test_parse_nil이_입력되면_nonNumber_error를_throw합니다() {
        // given
        let nilInput: String? = nil
        
        // when
        // then
        XCTAssertThrowsError(try LottoParser.parse(nilInput), "nil이 입력되면 파싱시도시 nonNumber error를 throw 합니다.") { error in
            XCTAssert(error is LottoParser.Error)
            XCTAssertEqual(error.localizedDescription, LottoParser.Error.nonNumber.localizedDescription)
        }
    }
}
