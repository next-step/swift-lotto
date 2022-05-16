//
//  LottoParserTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/15.
//

import XCTest

class LottoParserTest: XCTestCase {
    func test_parseLotto_사용자로부터_받은_로또문자열입력을_Lotto로_파싱하여_반환한다() {
        // given
        let lottoInput = "1, 2, 3, 4, 5, 6"
        
        let expectedLotto = try? DefaultLotto(numbers: [1, 2, 3, 4, 5, 6])
        
        // when
        guard let lotto = try? LottoParser.parseLotto(lottoInput) else {
            XCTFail("LottoParser.parse throw Error")
            exit(0)
        }
        
        // then
        XCTAssert(lotto.numbers == expectedLotto?.numbers)
    }
    
    func test_parse_nil이_입력되면_nonNumber_error를_throw합니다() {
        // given
        let nilInput: String? = nil
        
        // when
        // then
        XCTAssertThrowsError(try LottoParser.parseLotto(nilInput), "nil이 입력되면 파싱시도시 nonNumber error를 throw 합니다.") { error in
            XCTAssert(error is LottoParser.Error)
            XCTAssertEqual(error.localizedDescription, LottoParser.Error.nonNumber.localizedDescription)
        }
    }
}
